package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.InterviewDto;

public interface BsApplicantService {
	
	public List<InterviewDto> interviewList(String userId);

}
