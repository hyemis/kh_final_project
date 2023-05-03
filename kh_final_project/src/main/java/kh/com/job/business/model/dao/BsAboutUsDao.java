package kh.com.job.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.dto.CompanyDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.common.page.PagingInfoDto;

@Repository
public class BsAboutUsDao {

	@Autowired
	private SqlSession sqlSession;

	// 회원정보 불러오기
	public BsUserDto viewAccount(String userId) {
		return sqlSession.selectOne("business.viewAccount", userId);
	}
	
	// 회사소개 작성
	public int insertCompanyInfo(BoardDto dto) {
		sqlSession.insert("boards.insertCompanyInfo", dto);
		int boardNo = dto.getBoardNo();
		return boardNo;
	}
	
	// 회사소개 게시글 있는지 체크
	public BoardDto checkInfo(String userId) {
		return sqlSession.selectOne("boards.checkInfo", userId);
	}

	// 뉴스레터 작성
	public int insertNewsletter(BoardDto dto) {
		sqlSession.insert("boards.insertNewsletter", dto);
		int boardNum = dto.getBoardNo();
		return boardNum;
	}
	
	// 뉴스레터 리스트
	public List<BoardDto> newsLetterList(BoardDto dto) {
		return sqlSession.selectList("boards.newsLetterList", dto);
	}
	
	// 뉴스레터 게시글 수
	public int countNewsletter(BoardDto dto) {
		return sqlSession.selectOne("boards.countNewsletter", dto);
	}




	
	
	
	
	
}
