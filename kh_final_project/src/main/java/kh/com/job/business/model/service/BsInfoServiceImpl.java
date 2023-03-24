package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsInfoDao;
import kh.com.job.business.model.dto.BsInfoDto;

@Service
public class BsInfoServiceImpl implements BsInfoService{
	
	@Autowired
	private BsInfoDao dao;

	@Override
	public int insert(BsInfoDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BsInfoDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(BsInfoDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BsInfoDto selectOne(int boardNum, String writer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectOneCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectOneCount(String searchWord) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BsInfoDto> selectList() {
		return dao.selectList();
	}

	@Override
	public List<BsInfoDto> selectList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BsInfoDto> selectList(int currentPage, int limit, String searchWord) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
