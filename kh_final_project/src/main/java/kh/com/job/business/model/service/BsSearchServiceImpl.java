package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsSearchDao;
import kh.com.job.person.model.dto.PsResumeDto;

@Service
public class BsSearchServiceImpl implements BsSearchService{
	
	@Autowired
	private BsSearchDao dao;

	@Override
	public List<PsResumeDto> searchResume(String resumeNo) {
		return dao.searchResume(resumeNo);
	}

}
