package kh.com.job.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsBoardDto;
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
	
	
	
	
	public int insert(BsBoardDto dto) {
		return sqlSession.insert("business.insert", dto);		
	}
	
	public BsBoardDto selectOne(int boardnum /* PK */) {          
		return sqlSession.selectOne("business.selectOne", boardnum); 
	}
	
	public List<BsBoardDto> selectList() {
		return sqlSession.selectList("business.selectList");
	}

/*
	public List<BsInfoDto> tag() {
		return sqlSession.selectList("boards.tag");
	}
	
	public int insert(BsInfoDto dto) {
		return sqlSession.insert("boardns.insert", dto);		
	}
	
	public int update(BsInfoDto dto) {
		return sqlSession.update("boardns.update", dto);		
	}
	
	public int delete(BsInfoDto dto) {
		return sqlSession.delete("boardns.delete", dto);		
	} 
 
  
  
 */
}
