package kh.com.job.temp.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.temp.model.dto.ApplyProcessDto;
import kh.com.job.temp.model.dto.TempDto;

@Repository
public class TempDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<TempDto> memberList() {
		return sqlSession.selectList("temp.memberList");
	}
	
	
	public List<ApplyProcessDto> applyProcessList() {
		return sqlSession.selectList("temp.applyProcessList");
	}
	
	
	public PsUserDto loginCheck(String username) {
		return sqlSession.selectOne("temp.logincheck", username);
	}
}
