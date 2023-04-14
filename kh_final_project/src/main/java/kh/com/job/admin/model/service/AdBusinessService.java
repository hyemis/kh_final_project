package kh.com.job.admin.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsRecruitDetailDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.common.page.Paging;

public interface AdBusinessService {

	public List<BsRecruitDto> recruitAllList();

	public Paging pageList(String search, int pnum);

	public BsRecruitDetailDto viewDetail(String raNum);

	public BsUserDto userDetail(String userId);

}
