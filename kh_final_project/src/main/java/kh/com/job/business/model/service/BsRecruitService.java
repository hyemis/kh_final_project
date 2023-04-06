package kh.com.job.business.model.service;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.business.model.dto.BsUserDto;

public interface BsRecruitService {

	public Object getCateList(String categoryType);

	public String uploadDocument(MultipartFile uploadReport);

}
