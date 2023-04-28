package kh.com.job.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.admin.model.dao.AdAccountDao;
import kh.com.job.admin.model.dao.AdDao;
import kh.com.job.admin.model.dto.AdBannerDto;

@Service
public class AdServiceImpl implements AdService{
	
	@Autowired
	private AdAccountDao dao;
	
	@Autowired
	private AdDao addao;

	@Override
	public List<AdBannerDto> bannerList() {
		return addao.bannerList();
	}

	@Override
	public AdBannerDto bannerDetail(int id) {
		return addao.bannerDetail(id);
	}


}
