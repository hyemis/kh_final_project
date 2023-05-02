package kh.com.job.board.model.service;

import java.util.List;
import java.util.Map;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.dto.CompanyDto;
import kh.com.job.board.model.dto.ReplyDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingAplicantDto;
import kh.com.job.common.page.PagingBoardDto;
import kh.com.job.person.model.dto.PsCertiDto;

public interface BoardService {
	
	// 커뮤니티 게시판 카테고리
	public List<AdCategoryDto> getBoardCate() throws Exception;
	
	// 카테고리 이름 
	public String getCateName(String categoryId) throws Exception;
	
	// 게시글 등록 
	public int insertPost(BoardDto dto) throws Exception;
	
	// 게시글 수정
	public int updatePost(BoardDto dto) throws Exception;
	
	// 게시글 상세 조회 + 조회 수 증가
	public BoardDto detailBoard(String readUser, int boardNo) throws Exception;
	
	// 게시글 좋아요 증가 
	public int updateLike(String readUser, int boardNo) throws Exception;
	
	// 게시글 목록
	public List<BoardDto> postList(PagingBoardDto bdto) throws Exception;
	
	// 카테고리별 게시글 목록 
	public List<BoardDto> postListByCate(String cate) throws Exception;
	
	// 댓글 목록 
	public List<ReplyDto> replyList(int boardNo) throws Exception;
	
	// 댓글 등록
	public int insertReply(ReplyDto dto) throws Exception;
	
	// 댓글 삭제 
	public int deleteReply(ReplyDto dto) throws Exception;
	
	// 댓글 수정 
	public int updateReply(ReplyDto dto) throws Exception;
	
	// 인기글
	public  List<BoardDto> topReadPost() throws Exception;
	
	// 개인 카테고리 총 게시글 수 
	public int getCountByPs(PagingBoardDto bdto) throws Exception;
	
	// 카테고리 별 게시글 수 
	public int countByCate(String cate) throws Exception;
	
	// 페이징 
	public Paging pageList(PagingBoardDto bdto) throws Exception;
	
	public int update(BoardDto dto) throws Exception;
	public int delete(String userId) throws Exception;
	public BoardDto viewDetail(String boardNo);
	
	// 회사소개리스트
	public Paging companyInfoList(CompanyDto dto);
	// 회사소개 상세보기
	public CompanyDto companyInfoOne(int boardNo);
	// 뉴스레터 리스트
	public Paging newsletterAll(CompanyDto dto);
	// 뉴스레터 상세보기
	public CompanyDto newsletterOne(int boardNo);



}
