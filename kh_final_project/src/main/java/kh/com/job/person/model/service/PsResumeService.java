package kh.com.job.person.model.service;

import java.util.List;

import kh.com.job.person.model.dto.PsResumeDto;


public interface PsResumeService {
	
	// TODO: userid 수정 - 사용할 때 수정하기 
	public PsResumeDto selectOne(String userid) throws Exception;
	public List<PsResumeDto> selectList() throws Exception;
	public int insert(PsResumeDto dto) throws Exception;
	public int update(PsResumeDto dto) throws Exception;
	public int delete(String userid) throws Exception;
}
