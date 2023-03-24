package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsInfoDto;


public interface BsInfoService {
	
		public int insert(BsInfoDto dto);
		public int update(BsInfoDto dto);   
		public int delete(BsInfoDto dto);
		
		//하나 읽기
		public BsInfoDto selectOne(int boardNum, String writer /* PK */) ;
		public int selectOneCount();
		public int selectOneCount(String searchWord);

		public List<BsInfoDto> selectList();  // 전체읽기 *
		
		public List<BsInfoDto> selectList(int currentPage, int limit);  // paging처리하여 읽기
		public List<BsInfoDto> selectList(int currentPage, int limit, String searchWord);  // paging처리+검색하여 읽기

}
