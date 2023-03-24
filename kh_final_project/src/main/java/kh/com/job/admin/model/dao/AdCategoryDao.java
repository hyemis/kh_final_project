package kh.com.job.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.admin.model.dto.AdCategoryDto;

@Repository
public class AdCategoryDao {
	
	@Autowired
	private SqlSession sqlsession;

	public List<AdCategoryDto> cateFdeptList() {
		return sqlsession.selectList("admin.cateFdeptList");
	}

	public int addFirstCategory(AdCategoryDto dto) {
		return sqlsession.insert("admin.addFirstCategory", dto);
	}

	public int categoryCheck(String categoryId) {
		return sqlsession.selectOne("admin.categoryCheck", categoryId);
	}

	public int reqCheck(AdCategoryDto dto) {
		return sqlsession.selectOne("admin.reqCheck", dto);
	}

	public int delFirstCategory(AdCategoryDto dto) {
		return sqlsession.delete("admin.delFirstCategory", dto);
	}

	public List<AdCategoryDto> cateMdeptList(String categoryId) {
		return sqlsession.selectList("admin.cateMdeptList", categoryId);
	}

}
