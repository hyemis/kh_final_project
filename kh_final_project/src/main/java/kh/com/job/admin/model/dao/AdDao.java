package kh.com.job.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.admin.model.dto.AdUserDto;
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

	//admin.deleteAccount 는 삭제 admin.deleteAccount2 는 user_act 활성화 비활성화
	public int deleteAccount(String userId) {
		return sqlsession.delete("admin.deleteAccount", userId);
	}

	public AdUserDto checkUser(String userId) {
		return sqlsession.selectOne("admin.checkUser", userId);
	}

	public AdUserDto selectUser(String userId) {
		return sqlsession.selectOne("admin.selectUser", userId);
	}

	public int updateManager(AdUserDto dto) {
		return sqlsession.update("admin.updateManager", dto);
	}

}
