package kh.com.job.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.admin.model.dto.AdBannerDto;

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

}
