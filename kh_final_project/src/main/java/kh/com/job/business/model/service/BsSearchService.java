package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsSearchDto;
import kh.com.job.common.page.Paging;
import kh.com.job.person.model.dto.PsResumeDto;

public interface BsSearchService {

	
	
	public Paging resumePageList(BsSearchDto sdto);

}
