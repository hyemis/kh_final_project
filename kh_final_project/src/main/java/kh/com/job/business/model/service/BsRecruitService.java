package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;

public interface BsRecruitService {

	public Object getCateList(String categoryType);

	public String uploadDocument(MultipartFile uploadReport, String userId);

	public int insertRecruit(BsRecruitDto dto);

	public List<BsRecruitDto> recruitProgress(String userId);


}
