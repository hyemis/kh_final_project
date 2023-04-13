package kh.com.job.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.common.page.PagingInfoDto;

@Repository
public class AdBusinessDao {
	
	@Autowired
	private SqlSession sqlsession;

	public List<BsRecruitDto> recruitAllList() {
		return sqlsession.selectList("admin.recruitAllList");
	}

	public int pageListCount(String search) {
		return sqlsession.selectOne("admin.pageListCount", search);
	}

	public Object pageList(PagingInfoDto pdto) {
		return sqlsession.selectList("admin.pageList", pdto);
	}

	public BsRecruitDto viewDetail(String raNum) {
		return sqlsession.selectOne("admin.viewDetail", raNum);
	}

	public BsUserDto userDetail(String userId) {
		return sqlsession.selectOne("admin.userDetail", userId);
	}
	
	

}
