package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsUserDto;



public interface BsAboutUsService {
	
	//회원정보불러오기
	public BsUserDto viewAccount(String userId); 
	//글쓰기
	public int insertNewsletter(BoardDto dto);
	//수정
	public int updateNewsLetter(BoardDto dto); 
	//삭제
	public int deleteNewsLetter(BoardDto dto); 
	//하나읽기
	public BoardDto NewsLetterOne(String boardNum, String userId) ; 
	public int selectOneCount(); 
	public int selectOneCount(String searchWord);
	public List<BoardDto> newsLetterList(int currentPage, int limit, String searchWord); //뉴스레터 paging처리+검색하여 읽기
	

	
	

}
