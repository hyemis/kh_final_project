package kh.com.job.person.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.person.model.dto.PsResumeDto;


public interface PsResumeService {
	
	// TODO: userid 수정 - 사용할 때 수정하기 
	public PsResumeDto selectOne(String userId) throws Exception;
	public List<PsResumeDto> selectList(String userId) throws Exception;
	public int insert(PsResumeDto dto) throws Exception;
	public int update(PsResumeDto dto) throws Exception;
	public int delete(int resumeNo) throws Exception;
	
	// 파일 업로드 
	public String upload(MultipartFile file);
}
