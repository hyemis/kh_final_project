package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsRecruitAplicantDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;

public interface BsApplicantService {
	
	public List<BsRecruitAplicantDto> recruitList(String userId);

	public int aplicantAll(String userId);

	public List<BsAplicantDto> aplicantList(int raNum);
	
	//캘린더
	public List<InterviewDto> viewInterview(String userId);
	public int insertInterview(InterviewDto dto);
	

}
