package kh.com.job.person.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.dto.PsUnivDto;

@Repository
public class PsResumeDao {

	@Autowired
	private SqlSession sqlSession;

	public PsResumeDto selectOne(String userId) throws Exception {
		return sqlSession.selectOne("resume.selectOne", userId);
	}

	// 이력서 상세보기
	public PsResumeDto rselectOne(Map<String, Object> infoMap) throws Exception {
		return sqlSession.selectOne("resume.rselectOne", infoMap);
	}

	// 이력서 출력
	public List<PsResumeDto> selectList(String userId) throws Exception {
		return sqlSession.selectList("resume.selectList", userId);
	}

	// 이력서 등록
	public int insert(PsResumeDto dto) throws Exception {
		int result = -1;
		result = sqlSession.insert("resume.insert", dto);
		return result;
	}

	// 이력서 삭제
	public int delete(int resumeNo) throws Exception {
		return sqlSession.delete("resume.delete", resumeNo);
	}

	public int update(PsResumeDto dto) throws Exception {
		return sqlSession.update("resume.update", dto);
	}

	// 이력서-고등학교입력
	public int insertHschool(PsHschoolDto dto) throws Exception {
		return sqlSession.insert("resume.insertHschool", dto);
	}

	public List<PsHschoolDto> viewHschoolList(String userId) throws Exception {
		return sqlSession.selectList("resume.viewHschoolList", userId);
	}

	// 이력서-대학교입력
	public int insertUniv(PsUnivDto dto) throws Exception {
		return sqlSession.insert("resume.insertUniv", dto);
	}

	// 이력서-대학원입력
	public int insertGschool(PsGschoolDto dto) throws Exception {
		return sqlSession.insert("resume.insertGschool", dto);
	}

	// 이력서-경력사항입력
	public int insertCareer(PsCareerDto dto) throws Exception {
		return sqlSession.insert("resume.insertCareer", dto);
	}

	// 이력서-자격증입력
	public int insertCerti(PsCertiDto dto) throws Exception {
		return sqlSession.insert("resume.insertCerti", dto);
	}

	// highInfo - 입력
	public int insertHighInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertHighInfo", InfoNo);
	}

	// 이력서-고등학교 최신보기
	public int getMaxHighNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneHigh");
	}

	// UniInfo - 입력
	public int insertUniInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertUniInfo", InfoNo);
	}

	// 이력서-대학교 최신보기
	public int getMaxUniNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneUni");
	}
	
	// GradInfo - 입력
	public int insertGradInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertGradInfo", InfoNo);
	}
	
	// 이력서 - 대학원 최신보기
	public int getMaxGradNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneGrad");
	}
	
	// CareerInfo - 입력
	public int insertCareerInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertCareerInfo", InfoNo);
	}
	
	// 이력서 - 경력 최신보기
	public int getMaxCareerNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneCar");
	}
	
	// CertiInfo - 입력
	public int insertCertiInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertCertiInfo", InfoNo);
	}
	
	// 이력서 - 자격증 최신보기
	public int getMaxCertiNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneCerti");
	}
	
	// ClInfo - 입력
	public int insertClInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertClInfo", InfoNo);
	}
	
	// 이력서 - 자기소개서 최신보기
	public int getMaxClNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneCl");
	}
}
