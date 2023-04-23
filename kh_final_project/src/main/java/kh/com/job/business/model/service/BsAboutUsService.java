package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingInfoDto;



public interface BsAboutUsService {
	
	//회원정보불러오기
	public BsUserDto viewAccount(String userId); 
	
	//게시판리스트전부
	public List<BoardDto> listAll(String userId);

	//회사소개
	public int insertCompanyInfo(BoardDto dto);
	public int updateCompanyInfo(BoardDto dto);
	public BoardDto viewCompanyInfo(String userId);
	
	//뉴스레터
	public int insertNewsletter(BoardDto dto);
	public int updateNewsLetter(BoardDto dto); 
	public int deleteNewsLetter(BoardDto dto); 
	public BoardDto newsLetterOne(int boardNum, String userId) ; 
	public List<BoardDto> newsLetterList(String userId);

	//이미지 업로드
	public String uploadDocument(MultipartFile uploadReport, String userId);
}
