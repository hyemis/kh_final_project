package kh.com.job.person.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.person.model.dto.PsResumeDto;


public interface PsResumeService {
	
	// TODO: userid 수정 - 사용할 때 수정하기 
	
	public PsResumeDto selectOne(String userId) throws Exception;
	
	// 이력서 상세보기 
	public PsResumeDto rselectOne(Object[] params) throws Exception;
	
	// 이력서 리스트 
	public List<PsResumeDto> selectList(String userId) throws Exception;
	
	// 이력서 생성 
	public int insert(PsResumeDto dto) throws Exception;
	
	// 이력서 수정 
	public int update(PsResumeDto dto) throws Exception;
	
	// 이력서 삭제 
	public int delete(int resumeNo) throws Exception;
	
	// 파일 업로드 
	public String upload(MultipartFile file);
}
