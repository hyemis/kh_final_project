package kh.com.job.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.person.model.dto.PsUserDto;

@Repository
public class BsAboutUsDao {

	@Autowired
	private SqlSession sqlSession;
	
	//회원정보 불러오기
		public BsUserDto viewAccount(String userId) {
			return sqlSession.selectOne("business.viewAccount", userId);
		}
	
	
	
	
	public int insert(BoardDto dto) {
		return sqlSession.insert("business.insert", dto);		
	}
	
	public BoardDto selectOne(int boardnum /* PK */) {          
		return sqlSession.selectOne("business.selectOne", boardnum); 
	}
	
	public List<BoardDto> selectList() {
		return sqlSession.selectList("business.selectList");
	}


}
