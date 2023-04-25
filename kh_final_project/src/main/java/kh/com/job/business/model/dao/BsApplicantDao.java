package kh.com.job.business.model.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsAplicantListDto;
import kh.com.job.business.model.dto.BsAplicantRecruitDto;
import kh.com.job.business.model.dto.BsApplicantResumeDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;
import kh.com.job.common.page.PagingAplicantDto;

@Repository
public class BsApplicantDao {
	
	@Autowired
	private SqlSession sqlSession;
	

	public List<BsAplicantRecruitDto> recruitList(String userId) {
		return sqlSession.selectList("applicant.recruitList", userId);

	}

	public int insertInterview(InterviewDto dto) {
		return sqlSession.insert("applicant.insertInterview", dto);
	}

	public int aplicantAll(String userId) {
		return sqlSession.selectOne("applicant.aplicantAll", userId);
	}

	public List<BsAplicantDto> aplicantList(int raNum) {
		return null;
	}

	public List<InterviewDto> viewInterview(String userId) {
		return sqlSession.selectList("applicant.viewInterview", userId);
		}

	public List<BsRecruitDto> recruitTitle(String userId) {
		return sqlSession.selectList("applicant.recruitTitle", userId);
	}

	public int pageListCount(PagingAplicantDto pdto) {
		return sqlSession.selectOne("applicant.pageListCount", pdto);
	}

	public List<BsAplicantListDto> pageList(PagingAplicantDto pdto) {
		return sqlSession.selectList("applicant.pageList", pdto);
	}

	public BsApplicantResumeDto applicantResume(int resumeNo) {
		return sqlSession.selectOne("applicant.applicantResume", resumeNo);
	}


	

}
