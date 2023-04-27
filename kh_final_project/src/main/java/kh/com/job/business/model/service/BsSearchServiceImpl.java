package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsSearchDao;
import kh.com.job.business.model.dto.BsSearchDto;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingAplicantDto;
import kh.com.job.person.model.dto.PsResumeDto;

@Service
public class BsSearchServiceImpl implements BsSearchService{
	
	@Autowired
	private BsSearchDao dao;

//	@Override
//	public List<PsResumeDto> searchResume() {
//		return dao.searchResume();
//	}

	@Override
	public Paging resumePageList(BsSearchDto sdto) {
		//게시글이 표시될 개 수
		int pageLimit = 10;
		//페이지가 표시될 개 수
		int listLimit = 5;
		
		//총 게시글 개수
		int count = dao.resumePageListCount(sdto);

		//나타날 페이지의 첫번 째 글의 ra_num
		sdto.setStartNum((sdto.getPnum() -1)*pageLimit +1);
		//나타날 페이지의 마지막 글의 ra_num
		sdto.setEndNum(sdto.getPnum() * pageLimit);
		
		int mod = count % pageLimit ==0? 0 : 1;
		int pageCount = count/pageLimit + mod;
		
		//new Paging(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자 (<,1,2,3,4,5,> 여기서는 5))
		Paging list = new Paging(dao.resumePageListCount(sdto), sdto.getPnum(), pageCount);
		//만약 게시글이 표시될 개수와 페이지를 표시할 개수를 바꾸고 싶으면  new Paging
		//(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자, int 게시글이 표시될 개 수, listLimit)
		//로 생성한다.
		
		return list;
	}



}
