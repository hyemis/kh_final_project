package kh.com.job.temp.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.temp.model.dao.TempDao;
import kh.com.job.temp.model.dto.TempDto;

@Service
public class TempServiceImpl implements TempService{
	@Autowired
	private TempDao dao;

	@Override
	public List<TempDto> memberList() throws Exception {
		return dao.memberList();
	}

	
	
}
