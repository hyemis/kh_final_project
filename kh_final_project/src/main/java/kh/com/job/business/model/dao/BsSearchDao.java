package kh.com.job.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.person.model.dto.PsResumeDto;

@Repository
public class BsSearchDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<PsResumeDto> searchResume(String resumeNo) {
		return sqlSession.selectList("business.searchResume",resumeNo);
	}

	
	
	

}
