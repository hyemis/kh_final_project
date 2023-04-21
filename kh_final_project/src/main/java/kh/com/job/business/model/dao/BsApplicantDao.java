package kh.com.job.business.model.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;

@Repository
public class BsApplicantDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<InterviewDto> interviewList(String userId)  {
		return sqlSession.selectList("business.interviewList", userId);
		
	}

	public List<BsRecruitDto> recruitList(String userId) {
		return sqlSession.selectList("aplicant.recruitList", userId);
	}
	
	

}
