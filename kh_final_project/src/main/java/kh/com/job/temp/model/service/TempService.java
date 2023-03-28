package kh.com.job.temp.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.temp.model.dto.ApplyProcessDto;
import kh.com.job.temp.model.dto.TempDto;

public interface TempService {
	
	public List<TempDto> memberList() throws Exception;
	
	
	public List<ApplyProcessDto> applyProcessList() throws Exception;
	
	// 카카오 로그인 
	String getAccessToken(String authorize_code) throws Throwable;

	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
	
	public PsUserDto loginCheck(String userId) ;
	
	public String upload(MultipartFile file);

}
