package kh.com.job.person.model.service;

import java.util.List;

import kh.com.job.person.model.dto.PsDto;
import kh.com.job.temp.model.dto.TempDto;

public interface PsService {
	
	public PsDto selectOne(String userid) throws Exception;
	public List<PsDto> selectList() throws Exception;
	public int insert(PsDto dto) throws Exception;
	public int update(PsDto dto) throws Exception;
	public int delete(String userid) throws Exception;
}
