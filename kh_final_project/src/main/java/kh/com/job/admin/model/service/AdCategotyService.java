package kh.com.job.admin.model.service;

import java.util.List;

import kh.com.job.admin.model.dto.AdCategoryDto;

public interface AdCategotyService {

	public List<AdCategoryDto> cateFdeptList();

	public int addFirstCategory(AdCategoryDto dto);

	public int categoryCheck(String categoryId);

	public int reqCheck(AdCategoryDto dto);

	public int delFirstCategory(AdCategoryDto dto);

	public List<AdCategoryDto> cateMdeptList(String categoryId);

	public int addMiddleCategory(AdCategoryDto dto);

	public List<AdCategoryDto> listLastCate(String categoryId);

	public int addLastCategory(AdCategoryDto dto);

}
