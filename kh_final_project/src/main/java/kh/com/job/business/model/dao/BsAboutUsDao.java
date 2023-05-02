package kh.com.job.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.board.model.dto.BoardDto;
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
	
	//board table 게시글 전부
		public List<BoardDto> listAll(String userId) {
			return sqlSession.selectList("boards.listAll", userId);
		}
	
	// 뉴스레터 
	public int insertNewsletter(BoardDto dto) {
		sqlSession.insert("boards.insertNewsletter", dto);
		int boardNum = dto.getBoardNo();
		return boardNum;
	}
	
	public int updateNewsLetter(BoardDto dto) {
		return sqlSession.update("boards.updateNewsLetter", dto);
	}
	
	public int deleteNewsLetter(BoardDto dto) {
		return sqlSession.delete("boards.delete", dto);
	}

	public BoardDto newsLetterOne(int boardNo) {
		return sqlSession.selectOne("boards.newsLetterOne",boardNo);
	}

	public void updateReadCount(int boardNo) {
		// TODO Auto-generated method stub
		
	}
	
	public List<BoardDto> newsLetterList(String userId) {
		return sqlSession.selectList("boards.newsLetterList", userId);
	}

	
	
	// 회사소개 
	public int insertCompanyInfo(BoardDto dto) {
		sqlSession.insert("boards.insertCompanyInfo", dto);
		int boardNo = dto.getBoardNo();
		return boardNo;
	}

	public int updateCompanyInfo(BoardDto dto) {
		return sqlSession.update("boards.updateCompanyInfo", dto);
	}

	public BoardDto viewCompanyInfo(String userId) {
		return sqlSession.selectOne("boards.viewCompanyInfo", userId);
	}




	
	
	
	
	
}
