package com.itkey.sam.board.model.dao;

import java.util.List;

import com.itkey.sam.board.dto.AdminDTO;
import com.itkey.sam.board.dto.FileDTO;
import com.itkey.sam.board.dto.UserDTO;

public interface UserDAO {
	
	//유저 정보 조회
	public List<UserDTO> selectUserList(UserDTO dto) throws Exception;
	
	//회원가입
	public int userJoin(UserDTO dto) throws Exception;
	
	//회원중복체크
	public int idCheck(UserDTO dto) throws Exception;
	
	//로그인
	public UserDTO userLogin(UserDTO dto) throws Exception;
	
	//로그인 체크
	public int userLoginChk(UserDTO dto) throws Exception;
	
	//회원정보 수정
	public void modify(UserDTO dto) throws Exception;
	
	//회원 탈퇴
	public void userDelete(UserDTO dto) throws Exception;
	
	//관리자 로그인
	public AdminDTO adminLogin(AdminDTO dto) throws Exception;
	
	//관리자 로그인 체크
	public int adminLoginChk(AdminDTO dto) throws Exception;
	
	//프로필 이미지 
	public int insertProfile(FileDTO dto) throws Exception;
	
	//회원 강퇴
	public void adminDelete(UserDTO dto) throws Exception;

	
} 
