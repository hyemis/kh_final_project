package kh.com.job.temp.model.service;

import java.util.List;

import kh.com.job.temp.model.dto.BoardDto;
import kh.com.job.temp.model.dto.TempDto;

public interface TempService {
	
	public List<TempDto> memberList() throws Exception;
	
	public List<BoardDto> boardList() throws Exception;

}
