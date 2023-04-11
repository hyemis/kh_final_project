package kh.com.job.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.admin.model.dao.AdBusinessDao;
import kh.com.job.business.model.dto.BsRecruitDto;

@Service
public class AdBusinessServiceImpl implements AdBusinessService {
	
	@Autowired
	private AdBusinessDao dao;

	@Override
	public List<BsRecruitDto> recruitAllList() {
		return dao.recruitAllList();
	}

}
