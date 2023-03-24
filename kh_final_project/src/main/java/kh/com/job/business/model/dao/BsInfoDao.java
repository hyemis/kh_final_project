package kh.com.job.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsInfoDto;
import kh.com.job.person.model.dto.PsUserDto;

@Repository
public class BsInfoDao {

	@Autowired
	private SqlSession sqlSession;
	
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

	public List<BsInfoDto> selectList() {
		return sqlSession.selectList("business.selectList");
	}


}
