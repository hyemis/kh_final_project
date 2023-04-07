package kh.com.job.person.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.temp.model.dto.TempDto;

public interface PsService {
	
	public PsUserDto selectOne(String userId) throws Exception;
	public int idChk(String userId) throws Exception;
	public List<PsUserDto> selectList() throws Exception;
	public int insert(PsUserDto dto) throws Exception;
	public int update(PsUserDto dto) throws Exception;
	public int delete(String userId) throws Exception;
	public PsUserDto findId(Map<String, Object> findId) throws Exception;
	public PsUserDto findPw(Map<String, Object> findPw) throws Exception;
	
	// 카카오 로그인 
	String getAccessToken(String authorize_code) throws Throwable;
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
	public PsUserDto selectUserEmail(String userEmail) throws Throwable;
}
