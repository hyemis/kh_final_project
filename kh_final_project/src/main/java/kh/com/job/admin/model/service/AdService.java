package kh.com.job.admin.model.service;

import java.util.List;

import kh.com.job.person.model.dto.PsUserDto;

public interface AdService {
	
	public List<PsUserDto> accountmgr();
	public int idCheck(String userId);
	public int insertAccount(PsUserDto dto);
	public int deleteAccount(String userId);

}
