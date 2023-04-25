package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsAplicantListDto;
import kh.com.job.business.model.dto.BsAplicantRecruitDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingAplicantDto;

public interface BsApplicantService {
	
	public List<BsAplicantRecruitDto> recruitList(String userId);

	public int aplicantAll(String userId);

	public List<BsAplicantDto> aplicantList(int raNum);

	public List<BsRecruitDto> recruitTitle(String userId);

	public Paging pageList(PagingAplicantDto pdto);
	
	//캘린더
	public List<InterviewDto> viewInterview(String userId);
	public int insertInterview(InterviewDto dto);
	

}
