package kh.com.job.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsUserDto;

@Repository
public class BsAboutUsDao {

	@Autowired
	private SqlSession sqlSession;

	// 회원정보 불러오기
	public BsUserDto viewAccount(String userId) {
		return sqlSession.selectOne("business.viewAccount", userId);
	}
	
	// 뉴스레터 쓰기
	public int insertNewsletter(BoardDto dto) {
		sqlSession.insert("boards.insertNewsletter", dto);
		int boardNum = dto.getBoardNum();
		return boardNum;
//		return sqlSession.insert("boards.insertNewsletter", dto);
	}
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	
	//뉴스레터 업데이트
	public int updateNewsLetter(BoardDto dto) {
		return sqlSession.update("boards.updateNewsLetter", dto);
	}
	
	//뉴스레터 삭제
	public int deleteNewsLetter(BoardDto dto) {
		return sqlSession.delete("boards.deleteNewsLetter", dto);
		// TODO Auto-generated method stub
	}

	public BoardDto NewsLetterOne(String boardNum) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateReadCount(String boardNum) {
		// TODO Auto-generated method stub
		
	}
	
	//뉴스레터 리스트
	public List<BoardDto> newsLetterList(String userId) {
		return sqlSession.selectList("boards.newsLetterList", userId);
	}
	
	
	
	
	
}
