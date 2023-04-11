package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsBoardDto;


public interface BsAboutUsService {
	
	//글 등록
	public int insert(BsBoardDto dto) ;
	
	// 한 개 읽기
	public BsBoardDto selectOne(int boardnum);

	// 전체읽기 	
	public List<BsBoardDto> selectList();
	
	
	
/*	
		public int insert(BsInfoDto dto);
		public int update(BsInfoDto dto);   
		public int delete(BsInfoDto dto);
		
		//하나 읽기
		public BsInfoDto selectOne(int boardNum, String writer  ) ; //PK
		public int selectOneCount();
		public int selectOneCount(String searchWord);

		public List<BsInfoDto> selectList();  // 전체읽기 
		
		public List<BsInfoDto> selectList(int currentPage, int limit);  // paging처리하여 읽기
		public List<BsInfoDto> selectList(int currentPage, int limit, String searchWord);  // paging처리+검색하여 읽기
*/
}
