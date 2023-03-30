package kh.com.job.business.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsUserDto;

@Repository
public class BsAccountDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//
	public int insertAccount(BsUserDto dto) {
		return sqlSession.insert("business.insertAccount", dto);
	}
	
	//수정하기
	public int updateAccount(BsUserDto dto) {
		return sqlSession.update("business.updateAccount", dto);
	}
	
	//정보불러오기
	public BsUserDto viewAccount(String userId) {
		return sqlSession.selectOne("business.viewAccount", userId);
	}
	
}

