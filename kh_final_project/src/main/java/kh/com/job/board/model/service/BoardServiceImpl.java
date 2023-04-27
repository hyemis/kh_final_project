package kh.com.job.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.board.model.dao.BoardDao;
import kh.com.job.board.model.dto.BoardDto;

@Service
public  class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;

	@Override
	public BoardDto viewDetail(String boardNo) {
		return dao.viewDetail(boardNo);
	}
	
	@Override
	public BoardDto detailBoard(Map<String, Object> infoMap) throws Exception {
		return dao.detailBoard(infoMap);
	}

	@Override
	public List<BoardDto> boardList() throws Exception {
		return dao.boardList();
	}

	@Override
	public int insertBoard(BoardDto dto) throws Exception {
		return dao.insertBoard(dto);
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
