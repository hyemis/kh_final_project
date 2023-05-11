package kh.com.job.admin.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.admin.model.dto.AdBannerDto;
import kh.com.job.business.model.dto.BsRecruitDto;

public interface AdService {

	public List<AdBannerDto> bannerList();

	public AdBannerDto bannerDetail(int id);

	public String uploadThum(MultipartFile thumImage);

	public int bannerUpdate(AdBannerDto dto);

	public List<BsRecruitDto> recentRecruit();
	

}
