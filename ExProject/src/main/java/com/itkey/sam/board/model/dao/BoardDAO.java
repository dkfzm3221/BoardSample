package com.itkey.sam.board.model.dao;

import java.util.List;

import com.itkey.sam.board.dto.BoardDTO;
import com.itkey.sam.board.dto.FileDTO;
import com.itkey.sam.board.dto.UserDTO;
import com.itkey.sam.utils.Criteria;

public interface BoardDAO {

	/**
	 * 게시판 정보 조회
	 * @param eDTO 조회조건
	 * @return 결과 목록
	 */
	public List<BoardDTO> selectBoardList(BoardDTO eDTO) throws Exception;

	/**
	 * 게시판 정보 데이터 갯수 조회
	 * @param eDTO 조회조건
	 * @return 데이터 갯수
	 */
	public int selectBoardCount(BoardDTO eDTO) throws Exception;

	/**
	 * 게시판 정보 생성
	 * @param eDTO 생성할 데이터
	 * @return 입력 데이터 개수 (selectKey 를 사용하여 key 를 딴 경우 입력 DTO에 해당 key 사용)
	 * @throws Exception
	 */
	public int insertBoard(BoardDTO eDTO) throws Exception;

	/**
	 * 게시판 정보 수정
	 * @param eDTO 수정할 데이터
	 * @return 성공여부 (수정된 데이터 개수)
	 * @throws Exception
	 */
	
	public void boardUpdate(BoardDTO dto) throws Exception;
	/**
	 * 게시판 정보 삭제
	 * @param eDTO 삭제할 데이터 키값
	 * @return 성공여부 (삭제된 데이터 개수)
	 * @throws Exception
	 */

	//게시물 삭제
	public void deleteBoard(int boardIdx) throws Exception;
	
	
	//게시물 총 갯수
	public int count() throws Exception;

	//총 가입 유저 수
	public int totalUser() throws Exception;
	
	//오늘 게시물
	public int todayCount() throws Exception;
	
	//오늘 가입자 수
	public int todayUser() throws Exception;

	//조회수
	public int viewCount(int boardIdx) throws Exception;
	
	//이전글
	public BoardDTO pagePre(int boardIdx) throws Exception;
	
	//다음글
	public BoardDTO pageNext(int boardIdx) throws Exception;
	
	//파일 업로드
	public int insertFile(FileDTO dto) throws Exception;
	
	//페이징
	public List<BoardDTO> listPage(Criteria cri) throws Exception;
	
	//페이징 파일전체 개수
	public int getTotalCount(Criteria cri) throws Exception;
	
	//유저 페이징
	public List<UserDTO> listUser(Criteria cri) throws Exception;
	
	//파일이름
	public int getFileIdx(FileDTO dto) throws Exception;
	
	public int boardFileIdx(BoardDTO dto) throws Exception;
	
	
	
	
	
	
	
	
	

}