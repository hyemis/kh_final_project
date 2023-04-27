package kh.com.job.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.board.controller.boardController;
import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.person.model.dto.PsUserDto;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 상세조회 
	public BoardDto detailBoard(Map<String, Object> infoMap) throws Exception {
		return sqlSession.selectOne("boards.detailBoard", infoMap);
	}
	
	// 게시글 목록
	public List<BoardDto> boardList() throws Exception {
		return sqlSession.selectList("boards.boardList");
	}
	
	// 게시글 등록
	public int insertBoard(BoardDto dto) throws Exception {
		return sqlSession.insert("boards.insertBoard", dto);
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
