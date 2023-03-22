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
	
	public BoardDto selectOne(String userId) throws Exception {
		return sqlSession.selectOne("boards.selectOne", userId);
	}
	
	public List<BoardDto> selectList() throws Exception {
		return sqlSession.selectList("boards.selectList");
	}
	
	public int insert(BoardDto dto) throws Exception {
		int result = -1;
		result = sqlSession.insert("boards.insert", dto);
		return result;
	}
	
	public int delete(String userId)  throws Exception {
		return sqlSession.delete("boards.delete", userId);
	}
	
	public int update(BoardDto dto)  throws Exception {
		return sqlSession.update("boards.update", dto);
	}
	
}
