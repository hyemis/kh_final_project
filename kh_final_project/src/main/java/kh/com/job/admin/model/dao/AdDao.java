package kh.com.job.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.person.model.dto.PsUserDto;

@Repository
public class AdDao {
	
	@Autowired
	private SqlSession sqlsession;

	public List<PsUserDto> accountmgr() {
		
		return sqlsession.selectList("admin.accountmgr");
	}

	public int idCheck(String userId) {
		return sqlsession.selectOne("admin.idCheck", userId);
	}

	public int insertAccount(PsUserDto dto) {
		return sqlsession.insert("admin.insertAccount", dto);
	}

}
