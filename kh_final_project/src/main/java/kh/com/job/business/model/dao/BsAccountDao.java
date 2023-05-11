package kh.com.job.business.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsUserDto;

@Repository
public class BsAccountDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	//회원정보 수정하기
	public int updateAccount(BsUserDto dto) {
		return sqlSession.update("business.updateAccount", dto);
	}
	
	//비밀번호 수정하기
	public int updatePassword(BsUserDto dto) {
		return sqlSession.update("business.updatePassword", dto);
	}
	
	//회원정보 불러오기
	public BsUserDto viewAccount(String userId) {
		return sqlSession.selectOne("business.viewAccount", userId);
	}
	
	
}

