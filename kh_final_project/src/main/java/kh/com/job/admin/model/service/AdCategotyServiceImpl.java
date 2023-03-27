package kh.com.job.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.admin.model.dao.AdCategoryDao;
import kh.com.job.admin.model.dto.AdCategoryDto;

@Service
public class AdCategotyServiceImpl implements AdCategotyService{
	
	@Autowired
	private AdCategoryDao dao;

	@Override
	public List<AdCategoryDto> cateFdeptList() {
		return dao.cateFdeptList();
	}

	@Override
	public int addFirstCategory(AdCategoryDto dto) {
		return dao.addFirstCategory(dto);
	}

	@Override
	public int categoryCheck(String categoryId) {
		return dao.categoryCheck(categoryId);
	}

	@Override
	public int reqCheck(AdCategoryDto dto) {
		return dao.reqCheck(dto);
	}

	@Override
	public int delFirstCategory(AdCategoryDto dto) {
		return dao.delFirstCategory(dto);
	}

	@Override
	public List<AdCategoryDto> cateMdeptList(String categoryId) {
		return dao.cateMdeptList(categoryId);
	}

	@Override
	public int addMiddleCategory(AdCategoryDto dto) {
		return dao.addMiddleCategory(dto);
	}
	

}
