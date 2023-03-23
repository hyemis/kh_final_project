package kh.com.job.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.admin.model.dao.AdAccountDao;
import kh.com.job.admin.model.dto.AdUserDto;
import kh.com.job.person.model.dto.PsUserDto;

@Service
public class AdAccountServiceImpl implements AdAccountService{
	
	@Autowired
	private AdAccountDao dao;

	@Override
	public List<PsUserDto> accountmgr() {
		
		return dao.accountmgr();
	}

	@Override
	public int idCheck(String userId) {
		return dao.idCheck(userId);
	}

	@Override
	public int insertAccount(PsUserDto dto) {
		return dao.insertAccount(dto);
	}

	@Override
	public int deleteAccount(String userId) {
		return dao.deleteAccount(userId);
	}

	@Override
	public AdUserDto checkUser(String userId) {
		return dao.checkUser(userId);
	}

	@Override
	public AdUserDto selectUser(String name) {
		return dao.selectUser(name);
	}

	@Override
	public int updateManager(AdUserDto dto) {
		return dao.updateManager(dto);
	}

}
