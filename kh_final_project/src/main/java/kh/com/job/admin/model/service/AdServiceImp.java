package kh.com.job.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.admin.model.dao.AdDao;
import kh.com.job.person.model.dto.PsUserDto;

@Service
public class AdServiceImp implements AdService{
	
	@Autowired
	private AdDao dao;

	@Override
	public List<PsUserDto> accountmgr() {
		
		return dao.accountmgr();
	}

}
