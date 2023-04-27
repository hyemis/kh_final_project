package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.person.model.dto.PsResumeDto;

public interface BsSearchService {

	
	public List<PsResumeDto> searchResume(String resumeNo);


}
