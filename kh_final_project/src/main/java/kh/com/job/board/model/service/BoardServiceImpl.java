package kh.com.job.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.board.model.dao.BoardDao;
import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.dto.ReplyDto;

@Service
public  class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;

	@Override
	public BoardDto viewDetail(String boardNo) {
		return dao.viewDetail(boardNo);
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
	public List<ReplyDto> replyList(int boardNo) throws Exception {
		return dao.replyList(boardNo);
	}

	@Override
	public List<BoardDto> boardList() throws Exception {
		return dao.boardList();
	}

	@Override
	public int insertBoard(BoardDto dto) throws Exception {
		return dao.insertBoard(dto);
	}

	@Override
	public int update(BoardDto dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int delete(String userId) throws Exception {
		return dao.delete(userId);
	}

	
}
