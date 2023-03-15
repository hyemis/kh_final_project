package kh.com.job.person.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.person.model.dao.PsDao;
import kh.com.job.person.model.dto.PsDto;
import kh.com.job.temp.model.dao.TempDao;

@Service
public class PsServieImpl implements PsService {
	
	@Autowired
	private PsDao dao;

	@Override
	public PsDto selectOne(String userid) throws Exception {
		return dao.selectOne(userid);
	}

	@Override
	public List<PsDto> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public int insert(PsDto dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(PsDto dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int delete(String userid) throws Exception {
		return dao.delete(userid);
	}
	
	
	

}
