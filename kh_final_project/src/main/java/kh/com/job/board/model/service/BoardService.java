package kh.com.job.board.model.service;

import java.util.List;

import kh.com.job.board.model.dto.BoardDto;

public interface BoardService {
	
	public BoardDto selectOne(String userId) throws Exception;
	public List<BoardDto> selectList() throws Exception;
	public int insert(BoardDto dto) throws Exception;
	public int update(BoardDto dto) throws Exception;
	public int delete(String userId) throws Exception;

}
