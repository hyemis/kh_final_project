package kh.com.job.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.admin.model.dao.AdBusinessDao;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingInfoDto;

@Service
public class AdBusinessServiceImpl implements AdBusinessService {
	
	@Autowired
	private AdBusinessDao dao;

	@Override
	public List<BsRecruitDto> recruitAllList() {
		return dao.recruitAllList();
	}

	@Override
	public Paging pageList(String search, int pnum) {
		
		int pageLimit = 10;
		int listLimit = 5;
		
		int count = dao.pageListCount(search);
		
		PagingInfoDto pdto = new PagingInfoDto();
		
		pdto.setStartNum((pnum -1)*pageLimit +1);
		pdto.setEndNum(pnum * pageLimit);
		pdto.setSearch(search);
		
		int mod = count % pageLimit ==0? 0 : 1;
		int pageCount = count/pageLimit + mod;
		
		Paging list = new Paging(dao.pageList(pdto), pnum, pageCount);
		
		return list;
	}

}
