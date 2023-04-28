package kh.com.job.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsSearchDto;
import kh.com.job.person.model.dto.PsResumeDto;

@Repository
public class BsSearchDao {
	
	@Autowired
	private SqlSession sqlSession;



	public Object resumePageList(BsSearchDto sdto) {
		return sqlSession.selectList("business.resumePageList", sdto);
	}

	public int resumePageListCount(BsSearchDto sdto) {
		return sqlSession.selectOne("business.resumePageListCount", sdto);
	}

	
	
	

}
