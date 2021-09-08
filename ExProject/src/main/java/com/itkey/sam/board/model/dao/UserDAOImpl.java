package com.itkey.sam.board.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itkey.sam.board.dto.AdminDTO;
import com.itkey.sam.board.dto.FileDTO;
import com.itkey.sam.board.dto.UserDTO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	
		private final Logger logger = LoggerFactory.getLogger(this.getClass());
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		//회원가입
		public int userJoin(UserDTO dto) throws Exception{
			
			int result = sqlSession.insert("userJoin", dto);
			
			return result;
		}
		
		//로그인
		@Override
		public UserDTO userLogin(UserDTO dto) throws Exception {
			
			UserDTO lDto = sqlSession.selectOne("userlogin", dto);
			logger.info(lDto.toString());
			return lDto;
		}
		
		@Override
		public int userLoginChk(UserDTO dto) throws Exception {
			
			return sqlSession.selectOne("userLoginChk", dto);
		}
		
		//로그인 id체크
		@Override
		public int idCheck(UserDTO dto) throws Exception {
		
			return sqlSession.selectOne("userLoginChk", dto);
		}

		//회원정보 수정
		@Override
		public void modify(UserDTO dto) throws Exception {

			sqlSession.update("modify", dto);
			
		}
		
		//회원탈퇴
		@Override
		public void userDelete(UserDTO dto) throws Exception {
			
			sqlSession.delete("userDelete", dto);
			
		}
		
		//관리자 로그인
		@Override
		public AdminDTO adminLogin(AdminDTO dto) throws Exception {
			
			AdminDTO aDto = sqlSession.selectOne("adminLogin", dto);
			
			return aDto;
		}
		
		//관리자 로그인 체크
		@Override
		public int adminLoginChk(AdminDTO dto) throws Exception {
			
			return sqlSession.selectOne("adminLoginChk", dto);
			
		}
		
		//유저 정보조회
		@Override
		public List<UserDTO> selectUserList(UserDTO dto) throws Exception {
			List<UserDTO> out = sqlSession.selectList("selectUser", dto);
			return out;
		}
		
		//프로필 이미지
		@Override
		public int insertProfile(FileDTO dto) throws Exception {
			
			return sqlSession.insert("insertProfile", dto);
		}
		
		//회원 강퇴
		@Override
		public void adminDelete(UserDTO dto) throws Exception {
			sqlSession.delete("adminDelete", dto);
			
		}

		
}
