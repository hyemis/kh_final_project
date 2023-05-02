package kh.com.job.business.model.service;


import org.springframework.web.multipart.MultipartFile;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.common.page.Paging;

public interface BsAboutUsService {
	
	//회원정보불러오기
	public BsUserDto viewAccount(String userId); 
	
	//회사소개
	public BoardDto checkInfo(String userId);
	public int insertCompanyInfo(BoardDto dto);
	
	//뉴스레터
	public int insertNewsletter(BoardDto dto);
	public Paging newsLetterList(BoardDto dto);

	//이미지 업로드
	public String uploadDocument(MultipartFile uploadReport, String userId);

}
