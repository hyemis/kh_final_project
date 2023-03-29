package kh.com.job.business.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsAccountDao;

@Service
public class BsAccountServiceImpl implements BsAccountService{
	
	@Autowired
	private BsAccountDao dao;

}
