package kh.com.job.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsRecruitDto;

@Repository
public class AdBusinessDao {
	
	@Autowired
	private SqlSession sqlsession;

	public List<BsRecruitDto> recruitAllList() {
		return sqlsession.selectList("admin.recruitAllList");
	}
	
	

}
