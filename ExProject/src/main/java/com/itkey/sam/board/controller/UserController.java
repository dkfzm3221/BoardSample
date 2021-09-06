package com.itkey.sam.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itkey.sam.board.dto.AdminDTO;
import com.itkey.sam.board.dto.FileDTO;
import com.itkey.sam.board.dto.UserDTO;
import com.itkey.sam.board.model.service.UserService;

@Controller
public class UserController {
	
	@Autowired UserService userService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//화원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String getUserJoin() throws Exception{
		
		return "/join";
	}
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody
	public void postUserJoin(UserDTO dto, RedirectAttributes ra,
				HttpServletResponse html, Model model, 
				MultipartHttpServletRequest request) throws Exception {
		
		//프로필 사진 업로드 
		MultipartFile mf = request.getFile("file");
		String originFileName = mf.getOriginalFilename();
		
		String changeName = originFileName + UUID.randomUUID();
		String path = "C:\\Users\\ITKEY\\git\\BoardSample\\ExProject\\src\\main\\webapp\\resources\\images";
		
		FileDTO fDto = new FileDTO();
		
		fDto.setFileOriginalName(originFileName);
		fDto.setFileChangeName(changeName);
		fDto.setFilePath(path);
		
		String safeFile = path + System.currentTimeMillis() + originFileName;
		
		try {
			
			mf.transferTo(new File(safeFile));
			
			
			//회원가입
			html.setContentType("text/html; charset=UTF-8");
			PrintWriter out = html.getWriter();
			int result = userService.idCheck(dto);
			String body = "";
			
			
			Date today = new Date();
			dto.setBoardWriterJoinDate(today);
			
			if(result == 1) {
				
				body =	"<script>"
						+ "alert('중복된 아이디 입니다.');"
						+ "location.href='/sam/join';"
						+ "</script>";
				
				out.print(body);
			} else {
				
				userService.insertProfile(fDto);
				
				dto.setFileIdx(fDto.getFileIdx());
				userService.userJoin(dto);
				
				body =	"<script>"
						+ "alert('회원가입 성공.');"
						+ "location.href='/sam/login';"
						+ "</script>";
				
				out.print(body);
			}
			
			
		}catch (IllegalStateException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
	

	}
	
	//로그인
	@RequestMapping("/login")
	public String userLogin() {
		return "login";
	}
	
	//로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public void userLogin(UserDTO dto, HttpServletRequest request, Model model, HttpServletResponse html) throws Exception {
		
		html.setContentType("text/html; charset=UTF-8");
		PrintWriter out = html.getWriter();
		HttpSession session = request.getSession();
		int result = userService.userLogin(dto);

		//1.아이디가 존재하는지 검사
		//2.만약 아이디가 존재 할 경우 조건문 실행
		//2-1 조건문 암호가 같을경우 -> 메인으로 리턴 
		//2-2 암호가 다를경우 -> 로그인으로 리턴 

		
		String body = "";
		
		if(result == 1) {
			
			body =	"<script>"
					+ "location.href='/sam/main';"
					+ "</script>";
			
			out.print(body);
			
			session.setAttribute("id", dto.getBoardWriter());
			
			
		
		} else if(result == 2) { //아이디는 같음
			
			body =	"<script>"
					+ "alert('비밀번호를 확인해 주세요.');"
					+ "location.href='/sam/login';"
					+ "</script>";
					
				/*	System.out.println("1212121212" + body);*/
					out.println(body);
					
		} else {
			
			body = 	"<script>"
					+ "alert('아이디를 확인해 주세요.');"
					+ "location.href='/sam/login';"
					+ "</script>";
			
					out.println(body);
		}
	}
	
	//유저 정보수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String getModify() throws Exception{
		
		return "/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(UserDTO dto, HttpSession session, Model model) throws Exception{
		
		userService.modify(dto);
		

		session.invalidate();
		
		return "redirect:/login";
	}
	
	//회원 탈퇴
	@RequestMapping(value = "/delUser", method = RequestMethod.GET)
	public String getDelete(HttpSession session) throws Exception{
		
		UserDTO dto = new UserDTO();
		String writer = (String) session.getAttribute("id");
		
		dto.setBoardWriter(writer);
		
		userService.userDelete(dto);
		
		return "/login";
	}

	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/login";
	}
	
	
	//관리자 로그인
	@RequestMapping(value = "/adminLogin")
	public String getAdminLogin() {
		
		return "/adminLogin";
	}
	//관리자 로그인
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public void postAdminLogin(HttpServletRequest request,  Model model, HttpServletResponse html, AdminDTO dto)throws Exception {
		
		html.setContentType("text/html; charset=UTF-8");
		PrintWriter out = html.getWriter();
		HttpSession session = request.getSession();
		int result = userService.adminLogin(dto);
		
		
		String body = "";
		
		if(result == 1) {
			
			body =	"<script>"
					+ "location.href='/sam/adminBoard';"
					+ "</script>";
			
			out.print(body);
			
			
			session.setAttribute("adminId", dto.getAdminId());
			
			
		
		} else if(result == 2) { //아이디는 같음
			
			body =	"<script>"
					+ "alert('비밀번호를 확인해 주세요.');"
					+ "location.href='/sam/adminLogin';"
					+ "</script>";
					
				/*	System.out.println("1212121212" + body);*/
					out.println(body);
					
		} else {
			
			body = 	"<script>"
					+ "alert('아이디를 확인해 주세요.');"
					+ "location.href='/sam/adminLogin';"
					+ "</script>";
			
					out.println(body);
		}
	}
	
/*	//관리자 - 회원강퇴
	@RequestMapping(value="/adminDelete", method = RequestMethod.GET)
	public String getAdminDelete(HttpSession session) throws Exception{
		UserDTO dto = new UserDTO();

		userService.adminDelete(dto);
	
		
		return "/adminUser";
	}
	
	
	
	*/
	
	
	
	
	
	
	
	
	

	
}
