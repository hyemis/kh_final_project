package kh.com.job.person.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.dto.PsUserDto;

@Repository
public class PsResumeDao {
	
	@Autowired
	private SqlSession sqlSession;

	public PsResumeDto selectOne(String userId) throws Exception {
		return sqlSession.selectOne("resume.selectOne", userId);
	}
	
	public List<PsResumeDto> selectList(String userId) throws Exception {
		return sqlSession.selectList("resume.selectList", userId);
	}
	
	public int insert(PsResumeDto dto) throws Exception {
		int result = -1;
		result = sqlSession.insert("resume.insert", dto);
		return result;
	}
	
	public int delete(String userid)  throws Exception {
		return sqlSession.delete("resume.delete", userid);
	}
	
	public int update(PsResumeDto dto)  throws Exception {
		return sqlSession.update("resume.update", dto);
	}

}
