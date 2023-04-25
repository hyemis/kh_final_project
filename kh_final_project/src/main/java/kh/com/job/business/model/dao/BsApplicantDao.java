package kh.com.job.business.model.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsRecruitAplicantDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;

@Repository
public class BsApplicantDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BsRecruitAplicantDto> recruitList(String userId) {
		return sqlSession.selectList("aplicant.recruitList", userId);
	}

	public int insertInterview(InterviewDto dto) {
		return sqlSession.insert("aplicant.insertInterview", dto);
	}

	public int aplicantAll(String userId) {
		return sqlSession.selectOne("aplicant.aplicantAll", userId);
	}

	public List<BsAplicantDto> aplicantList(int raNum) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
