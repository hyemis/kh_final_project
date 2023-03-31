package kh.com.job.business.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsUserDto;

@Repository
public class BsAccountDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public int insertAccount(BsUserDto dto) {
		return sqlSession.insert("business.insertAccount", dto);
	}
	
	//회원정보 수정하기
	public int updateAccount(BsUserDto dto) {
		return sqlSession.update("business.updateAccount", dto);
	}
	
	//비밀번호 수정하기
	public int updatePassword(BsUserDto dto) {
		return sqlSession.update("business.updatePassword", dto);
	}
	
	//회원 프로필 이미지 수정하기
	public int updateUimage(BsUserDto dto) {
		return sqlSession.update("business.updateUimage", dto);
	}
	
	//회원정보 불러오기
	public BsUserDto viewAccount(String userId) {
		return sqlSession.selectOne("business.viewAccount", userId);
	}
	
	//회원비밀번호 불러오기
	public BsUserDto getUserPw(String userId) {
		return sqlSession.selectOne("business.getUserPw", userId);
	}
	
	
}

