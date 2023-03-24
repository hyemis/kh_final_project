package kh.com.job.admin.model.service;

import java.util.List;

import kh.com.job.admin.model.dto.AdCategoryDto;

public interface AdCategotyService {

	public List<AdCategoryDto> cateFdeptList();

	public int addFirstCategory(AdCategoryDto dto);

	public int categoryCheck(String categoryId);

}
