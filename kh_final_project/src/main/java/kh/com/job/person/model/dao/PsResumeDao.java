package kh.com.job.person.model.dao;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsClDto;
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
	
	public int deleteCareer(int carNo) throws Exception {
		return sqlSession.delete("resume.deleteCareer", carNo);
	}

	// 이력서-자격증입력
	public int insertCerti(PsCertiDto dto) throws Exception {
		return sqlSession.insert("resume.insertCerti", dto);
	}

	// 이력서 - 자기소개서 입력
	public int insertCl(PsClDto dto) throws Exception {
		return sqlSession.insert("resume.insertCl", dto);
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

	// 고등학교 학력사항 보기
	public List<PsHschoolDto> selectListHigh(String userId) throws Exception {
		List<PsHschoolDto> highSchoolList = sqlSession.selectList("resume.selectListHigh", userId);
		for (PsHschoolDto hschool : highSchoolList) {
			if ("Y".equals(hschool.getGed())) {
				hschool.setHighName("검정고시");
				hschool.setHighMajor("");
				hschool.setHighDate(null);
				hschool.setGed("검정고시");
			} else {
				String dateString = hschool.getHighDate();
				if (dateString != null) {
					LocalDate date = LocalDate.parse(dateString.split(" ")[0]);
					hschool.setHighDate(date.toString());
				}
			}
		}

		return highSchoolList;
	}

	// 대학교 학력사항 보기
	public List<PsUnivDto> selectListUni(String userId) throws Exception {
		List<PsUnivDto> univList = sqlSession.selectList("resume.selectListUni", userId);

		for (PsUnivDto univ : univList) {
			switch (univ.getUniAct()) {
			case "Y":
				univ.setUniAct("졸업");
				break;
			case "N":
				univ.setUniAct("재학중");
				break;
			case "R":
				univ.setUniAct("휴학");
				break;
			default:
				univ.setUniAct("");
				break;
			}

			if ("T".equals(univ.getUniCategory())) {
				univ.setUniCategory("2,3년제");
			} else if ("F".equals(univ.getUniCategory())) {
				univ.setUniCategory("4년제");
			}

			String dateString = univ.getUniDate();
			if (dateString != null) {
				LocalDate date = LocalDate.parse(dateString.split(" ")[0]);
				univ.setUniDate(date.toString());
			}
		}

		return univList;
	}

	// 대학원 학력사항 보기
	public List<PsGschoolDto> selectListGrad(String userId) throws Exception {
		List<PsGschoolDto> gradList = sqlSession.selectList("resume.selectListGrad", userId);

		for (PsGschoolDto grad : gradList) {
			switch (grad.getGradAct()) {
			case "Y":
				grad.setGradAct("졸업");
				break;
			case "N":
				grad.setGradAct("재학중");
				break;
			case "R":
				grad.setGradAct("휴학");
				break;
			default:
				grad.setGradAct("");
				break;
			}

			if ("M".equals(grad.getGradCategory().trim())) {
				grad.setGradCategory("석사");
			} else {
				grad.setGradCategory("박사");
			}

			String dateString = grad.getGradDate();
			if (dateString != null) {
				LocalDate date = LocalDate.parse(dateString.split(" ")[0]);
				grad.setGradDate(date.toString());
			}
		}

		return gradList;
	}

	// 경력사항 학력사항 보기
	public List<PsCareerDto> selectListCareer(String userId) {
		List<PsCareerDto> careerList = sqlSession.selectList("resume.selectListCareer", userId);
		return careerList;
	}

	// 자격증 학력사항 보기
	public List<PsCertiDto> selectListCerti(String userId) {
		List<PsCertiDto> CertiList = sqlSession.selectList("resume.selectListCerti", userId);
		return CertiList;
	}

	// 자기소개서 보기
	public List<PsClDto> selectListCl(String userId) {
		List<PsClDto> ClList = sqlSession.selectList("resume.selectListCl", userId);
		return ClList;
	}

}
