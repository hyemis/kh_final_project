package kh.com.job.business.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsRecruitDto;

@Repository
public class BsRecruitDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 워크넷 API DB저장
	public int apiInsert(BsRecruitDto dto) throws Exception {
		return sqlSession.insert("business.apiInsert", dto);
	}

}
