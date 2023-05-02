package kh.com.job.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.business.model.dto.BsRecruitDetailDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingInfoDto;

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

	public Object getCateList(String categoryType) {
		return sqlSession.selectList("business.getCateList", categoryType);
	}

	public int insertRecruit(BsRecruitDto dto) {
		return sqlSession.insert("business.insertRecruit", dto);
	}

	public List<BsRecruitDto> recruitProgress(String userId) {
		return sqlSession.selectList("business.recruitProgress", userId);
	}

	public List<BsRecruitDto> recruitAdmission(String userId) {
		return sqlSession.selectList("business.recruitAdmission", userId);
	}
	
	public List<BsRecruitDto> recruitYAdmission() {
		return sqlSession.selectList("business.recruitYAdmission");
	}
	
	public List<BsRecruitDto> lCateRecruit(String categoryId) {
		return sqlSession.selectList("business.lCateRecruit", categoryId);
	}
	
	public int countYAdmission() {
		return sqlSession.selectOne("business.countYAdmission");
	}
	
	public int lCatecountYAdmission() { 
		return sqlSession.selectOne("business.lCatecountYAdmission");
	}
	
	public List<BsRecruitDto> searchList(Map<String, Object> searchParams){
		return sqlSession.selectList("business.searchList", searchParams);
	}

	public int changeAdmission(BsRecruitDto dto) {
		return sqlSession.update("business.changeAdmission", dto);
	}

	public Object recruitAll(PagingInfoDto pidto) {
		return sqlSession.selectList("business.recruitAll", pidto);
	}

	public int recruitAllCount(PagingInfoDto pidto) {
		return sqlSession.selectOne("business.recruitAllCount", pidto);
	}

	public int updateRecruit(BsRecruitDto dto) {
		return sqlSession.update("business.updateRecruit", dto);
	}

	public int deleteRecruit(BsRecruitDto dto) {
		return sqlSession.delete("business.deleteRecruit", dto);
	}
	
	public List<AdCategoryDto> cateForSearch(String categoryType) {
		return sqlSession.selectList("business.cateForSearch", categoryType);
	}

	public List<BsRecruitDetailDto> recentRecruit() {
		return sqlSession.selectList("business.recentRecruit");
	}


}
