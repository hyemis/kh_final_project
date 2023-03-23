package kh.com.job.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.admin.model.dao.AdDao;

@Service
public class AdServiceImpl implements AdService{
	
	@Autowired
	private AdDao dao;


}
