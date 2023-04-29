package kh.com.job.board.model.service;

import java.util.List;
import java.util.Map;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.dto.ReplyDto;
import kh.com.job.person.model.dto.PsCertiDto;

public interface BoardService {
	
	// 게시글 상세 조회 + 조회 수 증가
	public BoardDto detailBoard(String readUser, int boardNo) throws Exception;
	
	// 게시글 좋아요 증가 
	public int updateLike(String readUser, int boardNo) throws Exception;
	
	// 게시글 목록
	public List<BoardDto> boardList() throws Exception;
	
	// 게시글 등록 
	public int insertBoard(BoardDto dto) throws Exception;
	
	// 댓글 목록 
	public List<ReplyDto> replyList(int boardNo) throws Exception;
	
	// 댓글 등록
	public int insertReply(ReplyDto dto) throws Exception;
	
	// 댓글 삭제 
	public int deleteReply(ReplyDto dto) throws Exception;
	
	// 댓글 수정 
	public int updateReply(ReplyDto dto) throws Exception;
	
	public int update(BoardDto dto) throws Exception;
	public int delete(String userId) throws Exception;
	public BoardDto viewDetail(String boardNo);

}
