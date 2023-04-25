package kh.com.job.person.model.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.person.model.dto.PsScrapInfoDto;
import kh.com.job.person.model.dto.PsUserDto;

@Repository
public class PsDao {
	
	@Autowired
	private SqlSession sqlSession;

	// 회원 정보 읽어오기 
	public PsUserDto selectOne(String userId) throws Exception {
		PsUserDto user = sqlSession.selectOne("person.selectOne", userId);
		
		String dateString = user.getUserBirth();
		if (dateString != null) {
		    LocalDate date = LocalDate.parse(dateString.split(" ")[0]);
		        user.setUserBirth(date.toString());
		    }
		    return user;
		}
	
		
	
	// 카카오 로그인 
	public PsUserDto selectUserEmail(String userEmail) throws Exception {
		return sqlSession.selectOne("person.selectUserEmail", userEmail);
	}
	
	// 아이디 중복 체크 
	public int idChk(String userId) throws Exception {
		int result = sqlSession.selectOne("person.idChk", userId);
		return result;
	}
	
	public List<PsUserDto> selectList() throws Exception {
		return sqlSession.selectList("person.selectList");
	}
	
	// 회원 가입 
	public int insert(PsUserDto dto) throws Exception {
		int result = -1;
		result = sqlSession.insert("person.insert", dto);
		return result;
	}
	
	// 회원 탈퇴
	public int delete(String userId)  throws Exception {
		return sqlSession.delete("person.delete", userId);
	}
	
	// 회원 정보 수정
	public int update(PsUserDto dto)  throws Exception {
		return sqlSession.update("person.update", dto);
	}
	
	// 아이디 찾기
	public PsUserDto findId(Map<String, Object> findId)  throws Exception {
			return sqlSession.selectOne("person.findId", findId);
	}
	
	// 비밀번호 찾기 
	public PsUserDto findPw(Map<String, Object> findPw) throws Exception {
		return sqlSession.selectOne("person.findPw", findPw);
	}
	//기업 회원가입
	public int businessInsert(PsUserDto dto) {
		return sqlSession.insert("person.businessInsert", dto);
	}
	
	// 공고 스크랩 확인
	public int checkScrap(Map<String, Object> InfoNo) throws Exception {
		int result = sqlSession.selectOne("person.checkScrap", InfoNo);
		return result;
	}

	// 공고 스크랩하기
	public int scrapJob(Map<String, Object> InfoNo) throws Exception{
		return sqlSession.insert("person.scrapJob",InfoNo);
	}
	
	// 공고 스크랩 삭제
	public int deleteJob(Map<String, Object> InfoNo) throws Exception{
		return sqlSession.delete("person.deleteJob",InfoNo);
	}
	
	// 스크랩한 공고 조회
	public List<PsScrapInfoDto> selectListScrap(String userId) throws Exception {
		return sqlSession.selectList("person.selectListScrap", userId);
	}


}
