package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;

public interface BsApplicantService {
	
	public List<InterviewDto> interviewList(String userId);

	public List<BsRecruitDto> recruitList(String userId);

}
