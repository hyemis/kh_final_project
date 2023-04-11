package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsAboutUsDao;
import kh.com.job.business.model.dto.BsBoardDto;

@Service
public class BsAboutUsServiceImpl implements BsAboutUsService{
	
	@Autowired
	private BsAboutUsDao dao;


	@Override
	public int insert(BsBoardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public BsBoardDto selectOne(int boardnum) {
		return dao.selectOne(boardnum);
	}

	@Override
	public List<BsBoardDto> selectList() {
		return dao.selectList();
	}
	
	
}
