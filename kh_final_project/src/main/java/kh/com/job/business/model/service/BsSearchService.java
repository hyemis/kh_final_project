package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsSearchDto;
import kh.com.job.business.model.dto.BsSuggestDto;
import kh.com.job.common.page.Paging;

public interface BsSearchService {

	public List<BsSearchDto> resumeList(BsSearchDto sdto); //정리

	public Paging pagingResumeList(BsSearchDto dto); 
	public List<BsRecruitDto> getRecruit(String userId);
	public int suggest(BsSuggestDto dto);
		
}
