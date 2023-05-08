package kh.com.job.business.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsSearchDto;
import kh.com.job.business.model.dto.BsSuggestDto;

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
		return sqlSession.selectList("business.pagingResumeList", dto);
	}

	public int resumeListCount(BsSearchDto dto) {
		return sqlSession.selectOne("business.resumeListCount");
	}

	public List<BsRecruitDto> getRecruit(String userId) {
		return sqlSession.selectList("suggest.getRecruit", userId);
	}

	public int suggest(BsSuggestDto dto) {
		return sqlSession.insert("suggest.suggest", dto);
	}

	public List<BsSuggestDto> bsSuggestList(BsSuggestDto dto) {
		return sqlSession.selectList("suggest.bsSuggestList",dto);
	}

	public int countbsSuggest(BsSuggestDto dto) {
		return sqlSession.selectOne("suggest.countbsSuggest",dto);
	}



}
