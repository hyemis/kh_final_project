package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dao.BsAboutUsDao;

@Service
public class BsAboutUsServiceImpl implements BsAboutUsService{
	
	@Autowired
	private BsAboutUsDao dao;


	@Override
	public int insert(BoardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public BoardDto selectOne(int boardnum) {
		return dao.selectOne(boardnum);
	}

	@Override
	public List<BoardDto> selectList() {
		return dao.selectList();
	}

	
	
}
