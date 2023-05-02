package kh.com.job.business.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsSearchDto;
import kh.com.job.person.model.dto.PsResumeDto;

@Repository
public class BsSearchDao {
	
	@Autowired
	private SqlSession sqlSession;



//	public Object resumePageList(BsSearchDto sdto) {
//		return sqlSession.selectList("business.resumePageList", sdto);
//	}

	public List<BsSearchDto> resumeList(BsSearchDto sdto) {
		return sqlSession.selectList("business.resumeList", sdto);
	}

	public Object pagingResumeList(BsSearchDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("business.pagingResumeList", dto);
	}

	public int resumeListCount(BsSearchDto dto) {
		return sqlSession.selectOne("business.resumeListCount");
	}

}
