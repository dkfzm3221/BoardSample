package com.itkey.sam.board.model.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itkey.sam.board.dto.AdminDTO;
import com.itkey.sam.board.dto.FileDTO;
import com.itkey.sam.board.dto.UserDTO;
import com.itkey.sam.board.model.dao.UserDAO;
import com.itkey.sam.utils.SecurityUtils;

@Service("userService")
public class UserServiceImpl implements UserService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "userDAO")
	UserDAO dao;
	
	//회원가입
	public int userJoin(UserDTO dto) throws Exception {
		
		//salt값 세팅
		String salt = SecurityUtils.generateSalt();
		dto.setSalt(salt);
		
		String password = dto.getBoardWriterPw();
		password = SecurityUtils.getEncrypt(password, salt);
		
		dto.setBoardWriterPw(password);
		
		int result = dao.userJoin(dto);
		return result;
	}

	// 로그인
	@Override
	public int userLogin(UserDTO dto) throws Exception {
		
		String salt = dao.getSaltById(dto.getBoardWriter());
		
		String password = dto.getBoardWriterPw();
		
		password = SecurityUtils.getEncrypt(password, salt);
		dto.setBoardWriterPw(password);
		
		
		int result = dao.userLoginChk(dto);


		
		if (result != 1) {
			return 3;
		} else {
		
			UserDTO lDto = dao.userLogin(dto);

			if (lDto.getBoardWriter().equals(dto.getBoardWriter())
					&& lDto.getBoardWriterPw().equals(dto.getBoardWriterPw())) {
				return 1;// 성공

			} else {
				
				return 2;// 비밀번호 틀림
			}

		}
	}

	@Override
	public int idCheck(UserDTO dto) throws Exception {
		

		
		int result = dao.idCheck(dto);
		return result;
	}
	
	//회원 정보 수정
	@Override
	public void modify(UserDTO dto) throws Exception {
		
		
		dao.modify(dto);
		
	}

	@Override
	public void userDelete(UserDTO dto) throws Exception {
		
		dao.userDelete(dto);
		
	}
	

	//관리자 로그인
	@Override
	public int adminLogin(AdminDTO dto) throws Exception {
		
		int result = dao.adminLoginChk(dto);
		

		if (result != 1) {
			
			return 3;
		} else {


			AdminDTO aDto = dao.adminLogin(dto);

			if (aDto.getAdminId().equals(dto.getAdminId())
					&& aDto.getAdminPw().equals(dto.getAdminPw())) {
				return 1;// 성공

			} else {
				
				return 2;// 비밀번호 틀림
			}

		}
	}

	//유저정보 조회
	@Override
	public List<UserDTO> getUserList(UserDTO dto) throws Exception {
		List<UserDTO> returnList = dao.selectUserList(dto);
		
		return returnList;
	}
	
	//프로필 이미지
	@Override
	public int insertProfile(FileDTO dto) throws Exception {
		
		return dao.insertProfile(dto);
	}

	@Override
	public void adminDelete(UserDTO dto) throws Exception {
		
		dao.adminDelete(dto);
	}
	
	//getSalt
	@Override
	public String getSaltById(String salt) throws Exception {
		
		return dao.getSaltById(salt);
	}





	
	
}
