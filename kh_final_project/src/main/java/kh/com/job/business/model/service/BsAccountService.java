package kh.com.job.business.model.service;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.business.model.dto.BsUserDto;

public interface BsAccountService {
	
	public int insertAccount(BsUserDto dto);
    public int updateAccount(BsUserDto dto);
    public int updatePassword(BsUserDto dto);
    public int updateUimage(BsUserDto dto);
    public int pwChk(String userPw) throws Exception;
    public BsUserDto viewAccount(String userId);
    public BsUserDto getUserPw(String userId);
	public String uploadUserPic(MultipartFile userImage, String name);
}
