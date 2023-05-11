package kh.com.job.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.admin.model.dto.AdBannerDto;
import kh.com.job.business.model.dto.BsRecruitDto;

@Repository
public class AdDao {
	
	@Autowired
	private SqlSession sqlsession;

	public List<AdBannerDto> bannerList() {
		return sqlsession.selectList("admin.bannerList");
	}

	public AdBannerDto bannerDetail(int id) {
		return sqlsession.selectOne("admin.bannerDetail", id);
	}

	public int bannerUpdate(AdBannerDto dto) {
		return sqlsession.update("admin.bannerUpdate", dto);
	}

	public List<BsRecruitDto> recentRecruit() {
		return sqlsession.selectList("admin.recentRecruit");
	}

}
