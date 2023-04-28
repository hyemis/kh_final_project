package kh.com.job.admin.model.service;

import java.util.List;

import kh.com.job.admin.model.dto.AdBannerDto;

public interface AdService {

	public List<AdBannerDto> bannerList();

	public AdBannerDto bannerDetail(int id);
	

}
