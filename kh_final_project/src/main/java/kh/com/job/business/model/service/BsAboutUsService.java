package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	//뉴스레터 리스트
	public List<BoardDto> newsLetterList(String userId);
	//이미지 업로드
	public String uploadDocument(MultipartFile uploadReport, String userId);
	
	/*
	public int selectOneCount(); 
	public int selectOneCount(String searchWord);
	*/
	

}
