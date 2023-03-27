package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsInfoDao;
import kh.com.job.business.model.dto.BsInfoDto;

@Service
public class BsInfoServiceImpl implements BsInfoService{
	
	@Autowired
	private BsInfoDao dao;


	@Override
	public int insert(BsInfoDto dto) {
		return dao.insert(dto);
	}

	@Override
	public BsInfoDto selectOne(int boardnum) {
		return dao.selectOne(boardnum);
	}

	@Override
	public List<BsInfoDto> selectList() {
		return dao.selectList();
	}
	
	
}
