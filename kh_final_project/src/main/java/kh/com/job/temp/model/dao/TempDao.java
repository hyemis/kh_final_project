package kh.com.job.temp.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.temp.model.dto.ApplyProcessDto;
import kh.com.job.temp.model.dto.BoardDto;
import kh.com.job.temp.model.dto.TempDto;

@Repository
public class TempDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<TempDto> memberList() throws Exception{
		return sqlSession.selectList("temp.memberList");
	}
	
	public List<BoardDto> boardList() throws Exception{
		return sqlSession.selectList("temp.boardList");
	}
	
	public List<ApplyProcessDto> applyProcessList() throws Exception{
		return sqlSession.selectList("temp.applyProcessList");
	}

}
