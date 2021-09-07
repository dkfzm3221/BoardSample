package com.itkey.sam.board.model.service;

import java.util.List;

import com.itkey.sam.board.dto.AdminDTO;
import com.itkey.sam.board.dto.FileDTO;
import com.itkey.sam.board.dto.UserDTO;

public interface UserService {

	//유저 정보조회
	public List<UserDTO> getUserList(UserDTO dto) throws Exception;
	
	//회원가입
	public int userJoin(UserDTO dto) throws Exception;
	
	//회원중복체크
	public int idCheck(UserDTO dto) throws Exception;
	
	//로그인
	public int userLogin(UserDTO dto) throws Exception;
	
	//회원정보 수정
	public void modify(UserDTO dto) throws Exception;
	
	//회원정보 탈퇴
	public void userDelete(UserDTO dto) throws Exception;
	
	//관리자 로그인
	public int adminLogin(AdminDTO dto) throws Exception;
	
	//프로필 이미지
	public int insertProfile(FileDTO dto) throws Exception;
	
	//회원강퇴
	public void adminDelete(UserDTO dto) throws Exception;



}
