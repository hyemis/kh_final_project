package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;

public interface BsApplicantService {
	
	public List<BsRecruitDto> recruitList(String userId);
	
	
	//캘린더
	public List<InterviewDto> viewInterview(String userId);
	public int insertInterview(InterviewDto dto);
}
