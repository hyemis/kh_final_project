package kh.com.job.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.board.controller.BoardController;
import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.dto.ReplyDto;
import kh.com.job.person.model.dto.PsUserDto;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 커뮤니티 게시판 카테고리 
	public List<AdCategoryDto> getBoardCate() throws Exception {
		return sqlSession.selectList("boards.getBoardCate");
	}
	
	// 카테고리 이름 
	public String getCateName(String categoryId) throws Exception {
		return sqlSession.selectOne("boards.getCateName", categoryId);
	}
	
	// 게시글 상세조회 
	public BoardDto detailBoard(int boardNo) throws Exception {
		return sqlSession.selectOne("boards.detailBoard", boardNo);
	}
	
	// 게시글 목록
	public List<BoardDto> postList() throws Exception {
		return sqlSession.selectList("boards.postList");
	}
	
	// 카테고리 별 게시글 목록 
	public List<BoardDto> postListByCate(String cate) throws Exception {
		return sqlSession.selectList("boards.postListByCate", cate);
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
	
	// 인기글
	public  List<BoardDto> topReadPost() throws Exception {
		return sqlSession.selectList("boards.topReadPost");
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
