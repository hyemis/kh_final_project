package kh.com.job.person.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.dto.PsUnivDto;


public interface PsResumeService {
	
	// TODO: userid 수정 - 사용할 때 수정하기 
	
	public PsResumeDto selectOne(String userId) throws Exception;
	
	// 이력서 상세보기 
	public PsResumeDto rselectOne(Map<String, Object> infoMap) throws Exception;
	
	// 이력서 리스트 
	public List<PsResumeDto> selectList(String userId) throws Exception;
	
	// 이력서 생성 
	public int insert(PsResumeDto dto) throws Exception;
	
	// 이력서 수정 
	public int update(PsResumeDto dto) throws Exception;
	
	// 이력서 삭제 
	public int delete(int resumeNo) throws Exception;
	
	// 파일 업로드 
	public String upload(MultipartFile file,  String userId);
	
	// 이력서 - 고등학교입력
	public int insertHschool(PsHschoolDto dto) throws Exception;
	public List<PsHschoolDto> viewHschoolList(String userId) throws Exception;
	
	// 이력서 - 대학교입력
	public int insertUniv(PsUnivDto dto) throws Exception;
	
	// 이력서-대학원 입력
	public int insertGschool(PsGschoolDto dto) throws Exception;
	
	// 이력서-경력사항 입력
	public int insertCareer(PsCareerDto dto) throws Exception;
	
	// 이력서-자격증 입력
	public int insertCerti(PsCertiDto dto) throws Exception;
	
	// highInfo  
	public int getMaxHighNo() throws Exception;
	public int insertHighInfo(Map<String, Object> InfoNo) throws Exception;
	
	// uniInfo
	public int getMaxUniNo() throws Exception;
	public int insertUniInfo(Map<String, Object> InfoNo) throws Exception;
	
	// gradInfo
	public int getMaxGradNo() throws Exception;
	public int insertGradInfo(Map<String, Object> InfoNo) throws Exception;
	
	// CareerInfo 
	public int getMaxCareerNo() throws Exception;
	public int insertCareerInfo(Map<String, Object> InfoNo) throws Exception;
	
	// CertiInfo
	public int getMaxCertiNo() throws Exception;
	public int insertCertiInfo(Map<String, Object> InfoNo) throws Exception;
	
	// ClInfo
	public int getMaxClNo() throws Exception;
	public int insertClInfo(Map<String, Object> InfoNo) throws Exception;
	


}
