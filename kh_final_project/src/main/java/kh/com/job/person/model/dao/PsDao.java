package kh.com.job.person.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.person.model.dto.PsDto;

@Repository
public class PsDao {
	
	@Autowired
	private SqlSession sqlSession;

	public PsDto selectOne(String userid) throws Exception {
		return sqlSession.selectOne("person.selectOne", userid);
	}
	
	public List<PsDto> selectList() throws Exception {
		return sqlSession.selectList("person.selectList");
	}
	
	public int insert(PsDto dto) throws Exception {
		int result = -1;
		result = sqlSession.insert("person.insert");
		return result;
	}
	
	public int delete(String userid)  throws Exception {
		return sqlSession.delete("person.delete", userid);
	}
	
	public int update(PsDto dto)  throws Exception {
		return sqlSession.update("person.update", dto);
	}

}
