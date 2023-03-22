package kh.com.job.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.board.model.dao.BoardDao;
import kh.com.job.board.model.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao dao;
	
//	@Autowired
//	@Qualifier
//	private MemberDao mdao;
//	@Autowired
//	private ProductDao pdao;
	
	
}
