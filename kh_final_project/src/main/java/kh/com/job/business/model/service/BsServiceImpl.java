package kh.com.job.business.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsRecruitDao;
import kh.com.job.business.model.dto.BsRecruitDto;

@Service
public class BsServiceImpl implements BsService{
	
	@Autowired
	private BsRecruitDao dao;

	@Override
	public int apiInsert(BsRecruitDto dto) throws Exception {
		return dao.apiInsert(dto);
	}

}
