package kh.com.job.board.model.service;

import java.util.List;
import java.util.Map;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.person.model.dto.PsCertiDto;

public interface BoardService {
	
	// 게시글 상세 조회
	public BoardDto detailBoard(Map<String, Object> infoMap) throws Exception;
	
	// 게시글 목록
	public List<BoardDto> boardList() throws Exception;
	
	// 게시글 등록 
	public int insertBoard(BoardDto dto) throws Exception;
	
	
	
	public int update(BoardDto dto) throws Exception;
	public int delete(String userId) throws Exception;

}
