package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsAnnounceDto;
import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsAplicantListDto;
import kh.com.job.business.model.dto.BsAplicantRecruitDto;
import kh.com.job.business.model.dto.BsAppInfoDto;
import kh.com.job.business.model.dto.BsApplicantResumeDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingAplicantDto;
import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsClDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsUnivDto;

public interface BsApplicantService {
	
	public List<BsAplicantRecruitDto> recruitList(String userId);

	public int aplicantAll(String userId);

	public List<BsAplicantDto> aplicantList(int raNum);

	public List<BsRecruitDto> recruitTitle(String userId);

	public Paging pageList(PagingAplicantDto pdto);
	
	//캘린더
	public List<InterviewDto> viewInterview(String userId);
	public int insertInterview(InterviewDto dto);

	public BsApplicantResumeDto applicantResume(int resumeNo);

	public List<PsHschoolDto> highSelectList(int resumeNo);

	public List<PsUnivDto> uniSelectList(int resumeNo);

	public List<PsGschoolDto> gradSelectList(int resumeNo);

	public List<PsCareerDto> carSelectList(int resumeNo);

	public List<PsCertiDto> certiSelectList(int resumeNo);

	public PsClDto clSelectOne(int resumeNo);

	public BsAppInfoDto userInfo(String userId);

	public int resultInsert(BsAnnounceDto adto);

	public int updateResultType(BsAnnounceDto adto);

	public BsAplicantDto reseltView(int baNum);

	
	

}
