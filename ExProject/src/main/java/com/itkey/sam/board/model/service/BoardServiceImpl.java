package com.itkey.sam.board.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itkey.sam.board.dto.BoardDTO;
import com.itkey.sam.board.dto.FileDTO;
import com.itkey.sam.board.dto.UserDTO;
import com.itkey.sam.board.model.dao.BoardDAO;
import com.itkey.sam.utils.Criteria;


@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	// Logback logger (package : org.slf4j.Logger & org.slf4j.LoggerFactory)
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	/* 
	 * Follow can be used for DI
	 * @Autowired BoardDAO dao;
	 */
	
	// Dependency Injection With BoardDAO
	@Resource(name="boardDAO") BoardDAO dao;

	public List<BoardDTO> getBoardList(BoardDTO eDTO) throws Exception {
		logger.debug("* [SERVICE] Input  ◀ (Controller) : " + eDTO.toString());
		List<BoardDTO> returnList = dao.selectBoardList(eDTO);
		int res = dao.viewCount(returnList.get(0).getBoardIdx());
		System.out.println("servies 값 : " +  res);
		logger.debug("* [SERVICE] Output ◀ (DAO) : " + returnList.toString());
		return returnList;
	};
	
	public int getBoardCount(BoardDTO eDTO) throws Exception {
		logger.debug("* [SERVICE] Input  ◀ (Controller) : " + eDTO.toString());
		int result = (Integer)dao.selectBoardCount(eDTO);
		logger.debug("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	};

	public int addBoard(BoardDTO eDTO) throws Exception {
		logger.debug("* [SERVICE] Input  ◀ (Controller) : " + eDTO.toString());
		int result = dao.insertBoard(eDTO);
		logger.debug("* [SERVICE] Output ◀ (DAO) : " + result);
		return result;
	};

	//게시물 삭제
	public void deleteBoard(int boardIdx) throws Exception{
		dao.deleteBoard(boardIdx);
	}
	


	//게시물 수
	@Override
	public int count() throws Exception {
		
		return dao.count();
	}
	
	//총 가입 유저수
	@Override
	public int totalUser() throws Exception {
			
		return dao.totalUser();
	}
	
	//오늘 작성 글
	@Override
	public int todayCount() throws Exception {
		
		return dao.todayCount();
	}
	
	//오늘 가입자수
	@Override
	public int todayUser() throws Exception {
		
		return dao.todayUser();
	}
	
	//게시물 수정
	@Override
	public void boardUpdate(BoardDTO dto) throws Exception {
		dao.boardUpdate(dto);
		
	}
	
	//이전글
	@Override
	public BoardDTO pagePre(int boardIdx) throws Exception {
		
		return dao.pagePre(boardIdx);
	}
	
	//다음글
	@Override
	public BoardDTO pageNext(int boardIdx) throws Exception {
		
		return dao.pageNext(boardIdx);
	}
	
	//파일 업로드
	public int insertFile(FileDTO dto) throws Exception{
		
		return dao.insertFile(dto);
		
	}
	
	
	//페이징
	@Override
	public List<BoardDTO> listPage(Criteria cri) throws Exception {
		
		return dao.listPage(cri);
	}
	
	//페이징 파일전체개수
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		
		return dao.getTotalCount(cri);
	}
	
	//유저페이징
	@Override
	public List<UserDTO> listUser(Criteria cri) throws Exception {
		
		return dao.listUser(cri);
	}

	@Override
	public int getFileIdx(UserDTO dto) throws Exception {
		
		return dao.getFileIdx(dto);
	}

	@Override
	public int boardFileIdx(BoardDTO dto) throws Exception {
	
		return dao.boardFileIdx(dto);
	}

	@Override
	public void adminDelete(String boardIdx) throws Exception {
		
		dao.adminDelete(boardIdx);
	}



}