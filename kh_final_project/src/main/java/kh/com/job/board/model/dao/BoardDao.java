package kh.com.job.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.board.controller.boardController;
import kh.com.job.board.model.dto.BoardDto;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	
}
