package kh.com.job.business.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dao.BsAboutUsDao;
import kh.com.job.business.model.dto.BsUserDto;



@Service
public class BsAboutUsServiceImpl implements BsAboutUsService{
	
	@Autowired
	private BsAboutUsDao dao;
	
	//USER
	@Override
	public BsUserDto viewAccount(String userId) {
		return dao.viewAccount(userId);
	}

	//BOARD
	@Override
	@Transactional
	public int insert(BoardDto dto) {
		return dao.insertNewsletter(dto);
	}
	
	@Override
	public int update(BoardDto dto) {
		return dao.updateNewsLetter(dto);
	}
	
	@Override
	public int delete(BoardDto dto) {
		return dao.deleteNewsLetter(dto);
	}

	@Override
	public BoardDto selectOne(String boardNum, String userId) {
		BoardDto result = dao.NewsLetterOne(boardNum);
		if(result!=null && !result.getUserId().equals(userId)) {
			dao.updateReadCount(boardNum);	
		}
		return result;
	}

	@Override
	public int selectOneCount() {
		return dao.selectOneCount();
	}

	@Override
	public int selectOneCount(String searchWord) {
		return dao.selectOneCount(searchWord);
	}

	@Override
	public List<BoardDto> newsLetterList(int currentPage, int limit, String searchWord) {
		return dao.selectList(currentPage, limit, searchWord);
	}

	

	
	
	
	
}
