package kh.com.job.business.model.service;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.business.model.dto.BsUserDto;

public interface BsAccountService {
	
    public int updateAccount(BsUserDto dto);
    public int updatePassword(BsUserDto dto);
    public BsUserDto viewAccount(String userId);
    public String uploadUserPic(MultipartFile userImage, String name);
//   public int updateUimage(BsUserDto dto);
//    public int pwChk(String userPw) ;
//   public BsUserDto getUserPw(String userId);
}
