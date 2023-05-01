package kh.com.job.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.board.model.dao.BoardDao;
import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.dto.CompanyInfoDto;
import kh.com.job.board.model.dto.ReplyDto;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingAplicantDto;
import kh.com.job.common.page.PagingBoardDto;

@Service
public  class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public List<AdCategoryDto> getBoardCate() throws Exception {
		return dao.getBoardCate();
	}
	
	@Override
	public String getCateName(String categoryId) throws Exception {
		return dao.getCateName(categoryId);
	}

	@Override
	public int insertPost(BoardDto dto) throws Exception {
		return dao.insertPost(dto);
	}
	
	@Override
	public int updatePost(BoardDto dto) throws Exception{
		return dao.updatePost(dto);
	}
	
	@Override
	public BoardDto detailBoard(String readUser, int boardNo) throws Exception {
		BoardDto result = dao.detailBoard(boardNo);
		if(!result.getUserId().equals(readUser)) {
			dao.updateRead(boardNo);
		}
		return result;
	}
	
	@Override
	public int updateLike(String readUser, int boardNo) throws Exception{
		BoardDto userId = dao.detailBoard(boardNo);
		if(!userId.getUserId().equals(readUser)) {
			int result = dao.updateLike(boardNo);
			return result;
		}
		return 0;
	}
	
	@Override
	public List<BoardDto> postList(PagingBoardDto bdto) throws Exception {
		return dao.postList(bdto);
	}
	
	@Override
	public List<BoardDto> postListByCate(String cate) throws Exception {
		return dao.postListByCate(cate);
	}
	
	@Override
	public List<ReplyDto> replyList(int boardNo) throws Exception {
		return dao.replyList(boardNo);
	}
	
	@Override
	public int insertReply(ReplyDto dto) throws Exception {
		return dao.insertReply(dto);
	}
	
	@Override
	public int deleteReply(ReplyDto dto) throws Exception {
		return dao.deleteReply(dto);
	}
	
	@Override
	public int updateReply(ReplyDto dto) throws Exception{
		return dao.updateReply(dto);
	}
	
	@Override
	public BoardDto viewDetail(String boardNo) {
		return dao.viewDetail(boardNo);
	}
	
	@Override
	public  List<BoardDto> topReadPost() throws Exception {
		return dao.topReadPost();
	}
	
	@Override
	public int getCountByPs(PagingBoardDto bdto) throws Exception {
		return dao.getCountByPs(bdto);
	}
	
	
	@Override
	public int countByCate(String cate) throws Exception{
		return dao.countByCate(cate);
	}
	
	// 페이징 
	@Override
	public Paging pageList(PagingBoardDto bdto) throws Exception {
		//게시글이 표시될 개 수
		int pageLimit = 10;
		//페이지가 표시될 개 수
		int listLimit = 5;
		
		//총 게시글 개수
		int count = dao.getCountByPs(bdto);
		
		// 나타날 페이지의 첫 번째 글의 ra_num
        int startNum = (bdto.getPnum() - 1) * pageLimit + 1;
        // 나타날 페이지의 마지막 글의 ra_num
        int endNum = bdto.getPnum() * pageLimit;

        bdto.setStartNum(startNum);
        bdto.setEndNum(endNum);

		
		int mod = count % pageLimit ==0? 0 : 1;
		int pageCount = count/pageLimit + mod;
		
		Paging list = new Paging(dao.postList(bdto), bdto.getPnum(), pageCount);
		return list;
	}

	@Override
	public int update(BoardDto dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int delete(String userId) throws Exception {
		return dao.delete(userId);
	}

	@Override
	public List<CompanyInfoDto> companyInfoList(int boardNo) {
		return dao.companyInfoList(boardNo);
	}

	@Override
	public CompanyInfoDto companyInfoOne(int boardNo) {
		return dao.companyInfoOne(boardNo);
	}

	
}
