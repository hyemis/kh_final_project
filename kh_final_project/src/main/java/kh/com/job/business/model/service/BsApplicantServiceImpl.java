package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.com.job.business.model.dao.BsApplicantDao;
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
import kh.com.job.common.page.PagingInfoDto;
import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsClDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsUnivDto;

@Service
public class BsApplicantServiceImpl implements BsApplicantService {
	
	@Autowired
	private BsApplicantDao dao;

	@Override
	public List<BsAplicantRecruitDto> recruitList(String userId) {
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

	@Override
	public List<BsRecruitDto> recruitTitle(String userId) {
		return dao.recruitTitle(userId);
	}

	@Override
	public Paging pageList(PagingAplicantDto pdto) {
		//게시글이 표시될 개 수
		int pageLimit = 10;
		//페이지가 표시될 개 수
		int listLimit = 5;
		
		//총 게시글 개수
		int count = dao.pageListCount(pdto);

		//나타날 페이지의 첫번 째 글의 ra_num
		pdto.setStartNum((pdto.getPnum() -1)*pageLimit +1);
		//나타날 페이지의 마지막 글의 ra_num
		pdto.setEndNum(pdto.getPnum() * pageLimit);
		
		int mod = count % pageLimit == 0? 0 : 1;
		int pageCount = count/pageLimit + mod;
		
		//new Paging(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자 (<,1,2,3,4,5,> 여기서는 5))
		Paging list = new Paging(dao.pageList(pdto), pdto.getPnum(), pageCount);
		//만약 게시글이 표시될 개수와 페이지를 표시할 개수를 바꾸고 싶으면  new Paging
		//(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자, int 게시글이 표시될 개 수, listLimit)
		//로 생성한다.
		
		return list;
	}

	@Override
	public BsApplicantResumeDto applicantResume(int resumeNo) {
		return dao.applicantResume(resumeNo);
	}

	@Override
	public List<PsHschoolDto> highSelectList(int resumeNo) {
		return dao.highSelectList(resumeNo);
	}

	@Override
	public List<PsUnivDto> uniSelectList(int resumeNo) {
		return dao.uniSelectList(resumeNo);
	}

	@Override
	public List<PsGschoolDto> gradSelectList(int resumeNo) {
		return dao.gradSelectList(resumeNo);
	}

	@Override
	public List<PsCareerDto> carSelectList(int resumeNo) {
		return dao.carSelectList(resumeNo);
	}

	@Override
	public List<PsCertiDto> certiSelectList(int resumeNo) {
		return dao.certiSelectList(resumeNo);
	}

	@Override
	public PsClDto clSelectOne(int resumeNo) {
		return dao.clSelectOne(resumeNo);
	}

	@Override
	public BsAppInfoDto userInfo(String userId) {
		return dao.userInfo(userId);
	}

	@Override
	@Transactional
	public int resultInsert(BsAnnounceDto adto) {
		int result = -1 ;
		int scresult = dao.resultInsert(adto);
		if(scresult == 1) {
			result = dao.updateResultType(adto);
		}
		return result;
	}

	@Override
	public int updateResultType(BsAnnounceDto adto) {
		return dao.updateResultType(adto);
	}

	@Override
	public BsAplicantDto reseltView(int baNum) {
		return dao.reseltView(baNum);
	}

	@Override
	public Paging passPageList(PagingAplicantDto pdto) {
		//게시글이 표시될 개 수
		int pageLimit = 10;
		//페이지가 표시될 개 수
		int listLimit = 5;
		
		//총 게시글 개수
		int count = dao.passPageListCount(pdto);

		//나타날 페이지의 첫번 째 글의 ra_num
		pdto.setStartNum((pdto.getPnum() -1)*pageLimit +1);
		//나타날 페이지의 마지막 글의 ra_num
		pdto.setEndNum(pdto.getPnum() * pageLimit);
		
		int mod = count % pageLimit ==0? 0 : 1;
		int pageCount = count/pageLimit + mod;
		
		//new Paging(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자 (<,1,2,3,4,5,> 여기서는 5))
		Paging list = new Paging(dao.passPageList(pdto), pdto.getPnum(), pageCount);
		//만약 게시글이 표시될 개수와 페이지를 표시할 개수를 바꾸고 싶으면  new Paging
		//(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자, int 게시글이 표시될 개 수, listLimit)
		//로 생성한다.
		
		return list;
	}

	@Override
	public int passCount(String userId) {
		return dao.passCount(userId);
	}

	@Override
	public int failCount(String name) {
		// TODO Auto-generated method stub
		return dao.failCount(name);
	}

	@Override
	public int proceedCount(String name) {
		// TODO Auto-generated method stub
		return dao.proceedCount(name);
	}

	@Override
	public BsAnnounceDto announceView(BsAnnounceDto adto) {
		return dao.announceView(adto);
	}

	@Override
	@Transactional
	public int resultUpdate(BsAnnounceDto adto) {
		int result = -1 ;
		int scresult = dao.resultUpdate(adto);
		if(scresult == 1) {
			result = dao.updateResultType(adto);
		}
		return result;
	}




	
	
	
	


}
