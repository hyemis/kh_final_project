package kh.com.job.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.board.controller.BoardController;
import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.dto.ReplyDto;
import kh.com.job.person.model.dto.PsUserDto;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 상세조회 
	public BoardDto detailBoard(int boardNo) throws Exception {
		return sqlSession.selectOne("boards.detailBoard", boardNo);
	}
	
	// 게시글 목록
	public List<BoardDto> boardList() throws Exception {
		return sqlSession.selectList("boards.boardList");
	}
	
	// 게시글 등록
	public int insertPost(BoardDto dto) throws Exception {
		return sqlSession.insert("boards.insertPost", dto);
	}
	
	// 게시글 수정 
	public int updatePost(BoardDto dto) throws Exception{
		return sqlSession.update("boards.updatePost", dto);
	}
	
	// 게시글 조회 수 증가 
	public int updateRead(int boardNo) throws Exception {
		return sqlSession.update("boards.updateRead", boardNo);
		
	}
	
	// 게시글 좋아요 증가 
	public int updateLike(int boardNo) throws Exception {
		return sqlSession.update("boards.updateLike", boardNo);
		
	}
	
	// 댓글 출력
	public List<ReplyDto> replyList(int boardNo) throws Exception {
		return sqlSession.selectList("boards.replyList", boardNo);
	}
	
	// 댓글 등록 
	public int insertReply(ReplyDto dto) throws Exception {
		return sqlSession.insert("boards.insertReply", dto);
	}
	
	// 댓글 삭제 
	public int deleteReply(ReplyDto dto) throws Exception {
		return sqlSession.update("boards.deleteReply", dto);
	}
	
	// 댓글 수정 
	public int updateReply(ReplyDto dto) throws Exception {
		return sqlSession.update("boards.updateReply", dto);
	}
	
	public int delete(String userId)  throws Exception {
		return sqlSession.delete("boards.delete", userId);
	}
	
	public int update(BoardDto dto)  throws Exception {
		return sqlSession.update("boards.update", dto);
	}
	//상세보기
	public BoardDto viewDetail(String boardNo) {
		return sqlSession.selectOne("boards.viewDetail", boardNo);
	}
	

	
}
