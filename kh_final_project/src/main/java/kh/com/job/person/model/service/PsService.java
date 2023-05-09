package kh.com.job.person.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kh.com.job.board.model.dto.CompanyDto;
import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsSuggestDto;
import kh.com.job.common.page.Paging;
import kh.com.job.person.model.dto.PsApplyDto;
import kh.com.job.person.model.dto.PsScrapInfoDto;
import kh.com.job.person.model.dto.PsUserDto;

public interface PsService {
	
	public PsUserDto selectOne(String userId) throws Exception;
	public int idChk(String userId) throws Exception;
	public List<PsUserDto> selectList() throws Exception;
	public int insert(PsUserDto dto) throws Exception;
	public int emailChk(String email) throws Exception;
	public int businessInsert(PsUserDto dto) throws Exception;
	public int update(PsUserDto dto) throws Exception;
	public int delete(String userId) throws Exception;
	public PsUserDto findId(Map<String, Object> findId) throws Exception;
	public PsUserDto findPw(Map<String, Object> findPw) throws Exception;
	public int scrapJob(Map<String, Object> InfoNo) throws Exception;
	public int deleteJob(Map<String, Object> InfoNo) throws Exception;
	public int checkScrap(Map<String, Object> InfoNo) throws Exception;
	public List<PsScrapInfoDto> selectListScrap(String userId) throws Exception;
	public List<PsApplyDto> selectListApply(String userId) throws Exception;
	public int checkApply(Map<String, Object> InfoNo) throws Exception;
	public int updateLoginRecord(String userId) throws Exception;
	public int checkComScrap(Map<String, Object> InfoNo) throws Exception;
	public int scrapCompany(Map<String, Object> InfoNo) throws Exception;
	public int deleteCompany(Map<String, Object> InfoNo) throws Exception;
	public List<PsScrapInfoDto> selectListCom(String userId) throws Exception;
	
	// userPic
	public int userPic(PsUserDto dto) throws Exception;
	 
	//입사지원
	public int applyJob(BsAplicantDto dto) throws Exception;
	//입사지원 취소
	public int cancelApply(Map<String, Object> InfoNo) throws Exception;
	
	
	// 카카오 로그인 
	String getAccessToken(String authorize_code) throws Throwable;
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
	public PsUserDto selectUserEmail(String userEmail) throws Throwable;
	
	//면접제안
	public Paging psSuggestList(BsSuggestDto dto);
	//면접수락
	public int interviewAccept(BsSuggestDto dto);
	public int updateAccept(BsSuggestDto dto);
	//면접제의 상세보기
	public BsSuggestDto viewSuggest(int sgNo);
	public CompanyDto suggestCompanyInfo(String bsUser);
	
	
	
}
