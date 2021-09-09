package com.itkey.sam.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itkey.sam.board.dto.BoardDTO;
import com.itkey.sam.board.dto.FileDTO;
import com.itkey.sam.board.dto.UserDTO;
import com.itkey.sam.board.model.service.BoardService;
import com.itkey.sam.board.model.service.UserService;
import com.itkey.sam.utils.Criteria;
import com.itkey.sam.utils.PageMaker;


@Controller
public class BoardController {
	// Logback logger (package : org.slf4j.Logger & org.slf4j.LoggerFactory)
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	// Dependency Injection With BoardService
	@Autowired
	BoardService boardService;	
	@Autowired
	UserService userService;

	/**
	 * @param requestParam
	 * @Method Post
	 * @return ModelAndView
	 * @url [default] http://localhost:8080/sam/main.do
	 * @throws Exception
	 */
	@RequestMapping(value = "/main")
	public ModelAndView sample(@RequestParam Map<String, Object> requestParam, Model model, Integer page, Criteria cri)
			throws Exception {
		// Logger
		logger.debug("Board List Page Response");
		
		
		//cri.setKeyword((String) requestParam.get("keyword"));
		//cri.setSearchType((String) requestParam.get("searchType"));
		//현재 페이지 게시물
		List<BoardDTO> boards = boardService.listPage(cri);
	
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = boardService.getTotalCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		
		System.out.println("끝페이지 : " + pageMaker.getEndPage());
		System.out.println("현재페이지지지 : " + pageMaker.getStartPage());
		
		
/*				------------------------------*/
		ModelAndView mv = new ModelAndView("main");
		BoardDTO eDTO = new BoardDTO();

		//총 가입 유저수
		int totalUser = boardService.totalUser();
		eDTO.setTotalUser(totalUser);
		model.addAttribute("totalUser", totalUser);
		
		//오늘 게시물 
		int todayCount = boardService.todayCount();
		eDTO.setTodayCount(todayCount);
		model.addAttribute("todayCount", todayCount);
	
		//오늘 가입자 수
		int todayUser = boardService.todayUser();
		eDTO.setTodayUser(todayUser);
		model.addAttribute("todayUser" , todayUser);
		
		int count = boardService.count();

		logger.debug("* [CONTROLLER] Input �뼳 (Service) : " + eDTO.toString());
		
		List<BoardDTO> list2 = boardService.getBoardList(eDTO);
		
		
		//model.addAttribute("list", eDTO);
		model.addAttribute("detailList", list2);
		model.addAttribute("list", boards);
		model.addAttribute("pageNum", count);
		model.addAttribute("pageMaker", pageMaker);
		
	
		return mv;
	}

	/**
	 * 게시물 작성
	 * @param session
	 * @param model
	 * @throws Exception 
	 */
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(HttpSession session, Model model) throws Exception {
		String id = (String) session.getAttribute("id");
		
		model.addAttribute("data", id);
	}
	
	//게시물 작성	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardDTO dto, HttpSession session, Model model, MultipartHttpServletRequest request) throws Exception {
		//파일 업로드
		MultipartFile mf = request.getFile("file");
		String originFileName = mf.getOriginalFilename();
		
		String changeName = originFileName + UUID.randomUUID();
		
		String path = "C:\\Users\\ITKEY\\git\\BoardSample_2\\ExProject\\src\\main\\webapp\\resources";
		
		FileDTO fDto = new FileDTO();
		
		fDto.setFileOriginalName(originFileName);
		fDto.setFileChangeName(changeName);
		fDto.setFilePath(path);
		
		String safeFile = path + System.currentTimeMillis() + originFileName;

	
		
		try {
			boardService.insertFile(fDto);
			mf.transferTo(new File(safeFile));
	
			Date today = new Date();
			dto.setBoardWriteDate(today);
			
			model.addAttribute("list", dto);
		
			dto.setFileIdx(fDto.getFileIdx());
			boardService.addBoard(dto);
		
		}catch (IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		

		boardService.fileName(fDto);
		
		
		return "redirect:/main";
	}
	
	//게시물 상세조회
	@RequestMapping(value = "/detail")
	public void detail(BoardDTO dto, Model model, @ModelAttribute("cri") Criteria cri) throws Exception{
		
		List<BoardDTO> detail = boardService.getBoardList(dto);
		

		
		BoardDTO pDto = boardService.pagePre(dto.getBoardIdx());
		BoardDTO nDto = boardService.pageNext(dto.getBoardIdx());

		
		model.addAttribute("list", detail.get(0));
		model.addAttribute("pagePre", pDto);
		model.addAttribute("pageNext", nDto);
		model.addAttribute("cri", cri);
		
		
		}
	
	//게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdateBoard(BoardDTO dto, Model model, @RequestParam("boardIdx") int boardIdx) throws Exception{
		
		
		List<BoardDTO> detail = boardService.getBoardList(dto);
		model.addAttribute("list", detail.get(0));
		
	
	}
	//게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdateBoard(BoardDTO dto) throws Exception{

		boardService.boardUpdate(dto);
		
		
		return "redirect:/detail?boardIdx=" + dto.getBoardIdx();
	}
	
	//게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("boardIdx") int boardIdx) throws Exception{
		
	
		boardService.deleteBoard(boardIdx);
		
		return "redirect:/main";
	}
	
	//관리자 게시물 삭제
	@RequestMapping(value = "/adminDelete", method = RequestMethod.GET)
	public String adminDelete(@RequestParam("boardIdx") int boardIdx, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		session.getAttribute("adminId");
		boardService.deleteBoard(boardIdx);
		
		return "redirect:/adminBoard";
	}
	
	//관리자 게시판 조회
	@RequestMapping(value = "/adminBoard")
	public String  adminBoardList(BoardDTO dto, Model model, Criteria cri) throws Exception{
		
		ModelAndView mv = new ModelAndView("main");

	/*	List<BoardDTO> adminBoardList = boardService.getBoardList(dto);*/

		int count = boardService.count();
		/*
		model.addAttribute("list", adminBoardList);
*/
		List<BoardDTO> boards = boardService.listPage(cri);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = boardService.getTotalCount(cri);
		
		pageMaker.setTotalCount(totalCount);
	
		model.addAttribute("pageNum", count);

		
		//총 가입 유저수
		int totalUser = boardService.totalUser();
		dto.setTotalUser(totalUser);
		model.addAttribute("totalUser", totalUser);
		
		//오늘 게시물 
		int todayCount = boardService.todayCount();
		dto.setTodayCount(todayCount);
		model.addAttribute("todayCount", todayCount);
		
		//오늘 가입자 수
		int todayUser = boardService.todayUser();
		dto.setTodayUser(todayUser);
		model.addAttribute("todayUser" , todayUser);
		
		
		model.addAttribute("list", boards);
		model.addAttribute("pageNum", count);
		model.addAttribute("pageMaker", pageMaker);
		
		return "/adminBoard";
	}
	
	
	//관리자 회원관리
	@RequestMapping(value = "/adminUser")
	public String adminUser(BoardDTO dto, Model model, UserDTO uDto, Criteria cri) throws Exception {
		
		ModelAndView mv = new ModelAndView("main");

		/*List<UserDTO> adminBoardList = userService.getUserList(uDto);*/
		/*
		model.addAttribute("list", adminBoardList);*/
		
		List<UserDTO> user = boardService.listUser(cri);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = boardService.getTotalCount(cri);
		
		pageMaker.setTotalCount(totalCount);
	
		int count = boardService.totalUser();
		model.addAttribute("pageNum", count);
		
		model.addAttribute("list", user);
		model.addAttribute("pageMaker", pageMaker);


		//총 가입 유저수
		int totalUser = boardService.totalUser();
		dto.setTotalUser(totalUser);
		model.addAttribute("totalUser", totalUser);
		
		//오늘 게시물 
		int todayCount = boardService.todayCount();
		dto.setTodayCount(todayCount);
		model.addAttribute("todayCount", todayCount);
		
		//오늘 가입자 수
		int todayUser = boardService.todayUser();
		dto.setTodayUser(todayUser);
		model.addAttribute("todayUser" , todayUser);
	
		return "/adminUser";
	}
	
	@RequestMapping(value= "/chat", method=RequestMethod.GET)
	public String chat(HttpServletRequest request, HttpServletResponse response, Model model, UserDTO dto) throws Exception{
		
		
		return "/chat";
	}
	
	
	
	
	

}