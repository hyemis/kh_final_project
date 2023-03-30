package kh.com.job.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kh.com.job.business.model.dto.BsRecruitDto;

@Repository
public class BsRecruitDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 워크넷 API DB저장
	public int apiInsert(List<BsRecruitDto> bsList) throws Exception {
		int result = 0;
		for(BsRecruitDto dto : bsList) {
			result += sqlSession.insert("business.apiInsert", dto);
		}
		return result;
	}

}
