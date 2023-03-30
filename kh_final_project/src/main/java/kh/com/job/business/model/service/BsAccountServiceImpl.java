package kh.com.job.business.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsAccountDao;
import kh.com.job.business.model.dto.BsUserDto;

@Service
public class BsAccountServiceImpl implements BsAccountService{
	
	@Autowired
	private BsAccountDao dao;

	@Override
	public int insertAccount(BsUserDto dto) {
		return dao.insertAccount(dto);
	}

	@Override
	public int updateAccount(BsUserDto dto) {
		return dao.updateAccount(dto);
	}

	
	@Override
	public BsUserDto viewAccount(String userId) {
		return dao.viewAccount(userId);
	}


	

}
