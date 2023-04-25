package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsApplicantDao;
import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsRecruitAplicantDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;

@Service
public class BsApplicantServiceImpl implements BsApplicantService {
	
	@Autowired
	private BsApplicantDao dao;

	@Override
	public List<BsRecruitAplicantDto> recruitList(String userId) {
		return dao.recruitList(userId);
	}

	@Override
	public int aplicantAll(String userId) {
		return dao.aplicantAll(userId);
	}

	@Override
	public List<BsAplicantDto> aplicantList(int raNum) {
		return dao.aplicantList(raNum);
	}
	
	@Override
	public int insertInterview(InterviewDto dto) {
	return dao.insertInterview(dto);
	}

	@Override
	public List<InterviewDto> viewInterview(String userId) {
		return dao.viewInterview(userId);
	}



	
	
	
	


}
