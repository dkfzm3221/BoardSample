package com.itkey.sam.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.sam.board.dto.BoardDTO;
import com.itkey.sam.board.dto.FileDTO;
import com.itkey.sam.board.dto.UserDTO;
import com.itkey.sam.utils.Criteria;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	// Logback logger (package : org.slf4j.Logger & org.slf4j.LoggerFactory)
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// Mybatis SqlSessionTemplate
	@Autowired private SqlSessionTemplate sqlSession;
	
	public List<BoardDTO> selectBoardList(BoardDTO eDTO) throws Exception {
		logger.debug("* [DAO] Input  ◀ (Service) : " + eDTO.toString());
		List<BoardDTO> out = sqlSession.selectList("selectBoard", eDTO);
		logger.debug("* [DAO] Output ◀ (Mybatis) : " + out.toString());
		return out;
	};

	public int selectBoardCount(BoardDTO eDTO) throws Exception {
		logger.debug("* [DAO] Input  ◀ (Service) : " + eDTO.toString());
		int result = sqlSession.selectOne("selectBoardCount", eDTO);
		logger.debug("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	};

	public int insertBoard(BoardDTO eDTO) throws Exception {
		logger.debug("* [DAO] Input  ◀ (Service) : " + eDTO.toString());
		int result = sqlSession.update("insertBoard", eDTO);
		logger.debug("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	};

	/*public int updateBoard(BoardDTO eDTO) throws Exception {
		logger.debug("* [DAO] Input  ◀ (Service) : " + eDTO.toString());
		int result = sqlSession.update("updateBoard", eDTO);
		logger.debug("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	};
*/
	/*public int deleteBoard(String keyId) throws Exception {
		logger.debug("* [DAO] Input  ◀ (Service) : " + keyId);
		int result = sqlSession.delete("deleteBoard", keyId);
		logger.debug("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}*/
	
	public void deleteBoard(int boardIdx) throws Exception {
		sqlSession.delete("deleteBoard", boardIdx);
	}
	//게시물 전체수
	@Override
	public int count() throws Exception {
		
		return sqlSession.selectOne("count");
	}
	
	
	//총 유저수
	@Override
	public int totalUser() throws Exception {
		
		return sqlSession.selectOne("totalUser");
	}

	@Override
	public int todayCount() throws Exception {
		
		return sqlSession.selectOne("todayCount");
	}

	@Override
	public int todayUser() throws Exception {
		
		return sqlSession.selectOne("todayUser");
	}
	
	//조회수
	@Override
	public int viewCount(int boardIdx) throws Exception {
		System.out.println("rkrrrr : " + boardIdx);
		return sqlSession.update("viewCount", boardIdx);
	}

	@Override
	public void boardUpdate(BoardDTO dto) throws Exception {
		sqlSession.update("boardUpdate", dto);
		
	}

	@Override
	public BoardDTO pagePre(int boardIdx) throws Exception {
		logger.debug("* [DAO] Input  ◀ (Service) : " + boardIdx);
		BoardDTO result = sqlSession.selectOne("pagePre", boardIdx);
		logger.debug("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	
	
	
	@Override
	public BoardDTO pageNext(int boardIdx) throws Exception {
		logger.debug("* [DAO] Input  ◀ (Service) : " + boardIdx);
		BoardDTO result = sqlSession.selectOne("pageNext", boardIdx);
		logger.debug("* [DAO] Output ◀ (Mybatis) : " + result);
		return result;
	}
	
	//파일업로드
	@Override
	public int insertFile(FileDTO dto) throws Exception {
		return sqlSession.insert("insertFile", dto);
	}
	
	//업로드 파일 이름 뿌리기
	@Override
	public FileDTO fileName(FileDTO dto) throws Exception {
		FileDTO fDto  = sqlSession.selectOne("fileName", dto);
		
		return fDto;
	}

	//업로드 파일 이름 뿌리기
	@Override
	public FileDTO boardFileIdx(int fileIdx) throws Exception {
		return sqlSession.selectOne("boardFileIdx", fileIdx);
		
	}
	
	
	
	//페이징
	@Override
	public List<BoardDTO> listPage(Criteria cri) throws Exception {
		
		return sqlSession.selectList("listPage", cri);
	}
	
	//페이징 파일 전체 수 
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		
		return sqlSession.selectOne("getTotalCount", cri);
	}
	
	//유저 페이징
	@Override
	public List<UserDTO> listUser(Criteria cri) throws Exception {
		
		return sqlSession.selectList("listUser", cri);
	}

	

}