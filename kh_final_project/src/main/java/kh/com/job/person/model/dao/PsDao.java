package kh.com.job.person.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.person.model.dto.PsUserDto;

@Repository
public class PsDao {
	
	@Autowired
	private SqlSession sqlSession;

	// 회원 정보 읽어오기 
	public PsUserDto selectOne(String userId) throws Exception {
		return sqlSession.selectOne("person.selectOne", userId);
	}
	
	// 아이디 중복 체크 
	public int idChk(String userId) throws Exception {
		int result = sqlSession.selectOne("person.idChk", userId);
		return result;
	}
	
	public List<PsUserDto> selectList() throws Exception {
		return sqlSession.selectList("person.selectList");
	}
	
	// 회원 가입 
	public int insert(PsUserDto dto) throws Exception {
		int result = -1;
		result = sqlSession.insert("person.insert", dto);
		return result;
	}
	
	public int delete(String userId)  throws Exception {
		return sqlSession.delete("person.delete", userId);
	}
	
	public int update(PsUserDto dto)  throws Exception {
		return sqlSession.update("person.update", dto);
	}

}
