package kh.com.job.person.model.service;

import java.util.List;

import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.temp.model.dto.TempDto;

public interface PsService {
	
	public PsUserDto selectOne(String userId) throws Exception;
	public List<PsUserDto> selectList() throws Exception;
	public int insert(PsUserDto dto) throws Exception;
	public int update(PsUserDto dto) throws Exception;
	public int delete(String userid) throws Exception;
}
