package kh.com.job.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.admin.model.dao.AdAccountDao;

@Service
public class AdServiceImpl implements AdService{
	
	@Autowired
	private AdAccountDao dao;


}
