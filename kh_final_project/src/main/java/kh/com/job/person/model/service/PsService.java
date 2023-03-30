package kh.com.job.person.model.service;

import java.util.HashMap;
import java.util.List;

import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.temp.model.dto.TempDto;

public interface PsService {
	
	public PsUserDto selectOne(String userId) throws Exception;
	public int idChk(String userId) throws Exception;
	public List<PsUserDto> selectList() throws Exception;
	public int insert(PsUserDto dto) throws Exception;
	public int update(PsUserDto dto) throws Exception;
	public int delete(String userId) throws Exception;
	
	// 카카오 로그인 
	String getAccessToken(String authorize_code) throws Throwable;
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
	public PsUserDto selectUserEmail(String userEmail) throws Throwable;
}
