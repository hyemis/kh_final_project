package kh.com.job.admin.model.service;

import java.util.List;

import kh.com.job.admin.model.dto.AdUserDto;
import kh.com.job.person.model.dto.PsUserDto;

public interface AdAccountService {
	
	public List<PsUserDto> accountmgr();
	public int idCheck(String userId);
	public int insertAccount(PsUserDto dto);
	public int deleteAccount(String userId);
	public AdUserDto checkUser(String userId);
	public AdUserDto selectUser(String name);
	public int updateManager(AdUserDto dto);

}
