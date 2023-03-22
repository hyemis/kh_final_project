package kh.com.job.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.board.model.dao.BoardDao;
import kh.com.job.board.model.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao dao;
	
	@Override
	public BoardDto selectOne(String userId) throws Exception {
		return dao.selectOne(userId);
	}

	@Override
	public List<BoardDto> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public int insert(BoardDto dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(BoardDto dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int delete(String userId) throws Exception {
		return dao.delete(userId);
	}
	
}
