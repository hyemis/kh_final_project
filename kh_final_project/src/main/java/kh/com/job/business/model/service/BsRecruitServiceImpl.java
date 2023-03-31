package kh.com.job.business.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsAccountDao;
import kh.com.job.business.model.dao.BsRecruitDao;
import kh.com.job.business.model.dto.BsUserDto;

@Service
public class BsRecruitServiceImpl implements BsRecruitService{
	
	@Autowired
	private BsAccountDao account;
	
	@Autowired
	private BsRecruitDao dao;

	@Override
	public Object getCateList(String categoryType) {
		return dao.getCateList(categoryType);
	}

}
