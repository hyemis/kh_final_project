package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsUserDto;



public interface BsAboutUsService {
	
	public BsUserDto viewAccount(String userId); //회원정보불러오기
	public int insert(BoardDto dto); //글쓰기
	public int update(BoardDto dto); //수정
	public int delete(BoardDto dto); //삭제
	public BoardDto selectOne(String boardNum, String userId) ; //하나읽기
	public int selectOneCount(); 
	public int selectOneCount(String searchWord);
	public List<BoardDto> newsLetterList(int currentPage, int limit, String searchWord); //뉴스레터 paging처리+검색하여 읽기

	
	

}
