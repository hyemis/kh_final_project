package kh.com.job.person.model.dao;

import java.time.LocalDate;
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

	// 이력서 등록 - return val : resumeNo
	public int insert(PsResumeDto dto) throws Exception {
		int resumeNo = -1;
		int result = -1;
		resumeNo = sqlSession.selectOne("resume.getResumeNextval");
		dto.setResumeNo(resumeNo);
		result = sqlSession.insert("resume.insert", dto);
		if (result < 1) {
			resumeNo = result;
		}
		return resumeNo;
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

	// 이력서 - 경력사항 삭제
	public int deleteCareer(int carNo) throws Exception {
		return sqlSession.delete("resume.deleteCareer", carNo);
	}

	// 이력서-자격증입력
	public int insertCerti(PsCertiDto dto) throws Exception {
		return sqlSession.insert("resume.insertCerti", dto);
	}

	// 이력서 - 자격증 삭제
	public int deleteCerti(int certiNo) throws Exception {
		return sqlSession.delete("resume.deleteCerti", certiNo);
	}

	// 이력서 - 자격증 수정
	public int updateCerti(Map<String, Object> updateCerti) throws Exception {
		return sqlSession.update("resume.updateCerti", updateCerti);
	}

	// 이력서 - 자기소개서 detail 보기
	public PsClDto selectOneCl(int clNo) throws Exception {
		PsClDto dto = sqlSession.selectOne("resume.selectOneCl", clNo);
		dto.setClFile(removeHtmlTag(dto.getClFile()));
		dto.setClGrowth(removeHtmlTag(dto.getClGrowth()));
		dto.setClMotive(removeHtmlTag(dto.getClMotive()));
		dto.setClAdv(removeHtmlTag(dto.getClAdv()));
		dto.setClAsp(removeHtmlTag(dto.getClAsp()));
		return dto;
	}

	// 이력서 - 자기소개서 입력
	public int insertCl(PsClDto dto) throws Exception {
		return sqlSession.insert("resume.insertCl", dto);
	}

	// 이력서 - 자기소개서 삭제
	public int deleteCl(int clNo) throws Exception {
		return sqlSession.delete("resume.deleteCl", clNo);
	}

	// 이력서 - 자기소개서 수정
	public int updateCl(Map<String, Object> updateCl) throws Exception {
		return sqlSession.update("resume.updateCl", updateCl);
	}

	// highInfo - 입력
	public int insertHighInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertHighInfo", InfoNo);
	}

	// 이력서-고등학교 최신보기
	public int getMaxHighNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneMaxHigh");
	}

	// UniInfo - 입력
	public int insertUniInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertUniInfo", InfoNo);
	}

	// 이력서-대학교 최신보기
	public int getMaxUniNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneMaxUni");
	}

	// GradInfo - 입력
	public int insertGradInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertGradInfo", InfoNo);
	}

	// 이력서 - 대학원 최신보기
	public int getMaxGradNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneMaxGrad");
	}

	// CareerInfo - 입력
	public int insertCareerInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertCareerInfo", InfoNo);
	}

	// 이력서 - 경력 최신보기
	public int getMaxCareerNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneMaxCar");
	}

	// 이력서 - 자격증Info 입력
	public int insertCertiInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertCertiInfo", InfoNo);
	}

	// 이력서 - 자격증 최신보기
	public int getMaxCertiNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneMaxCerti");
	}

	// 이력서 - 자격증info 삭제
	public int deleteInfoCerti(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.delete("resume.deleteInfoCerti", InfoNo);
	}

	// ClInfo - 입력
	public int insertClInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertClInfo", InfoNo);
	}

	// 이력서 - 자기소개서 최신보기
	public int getMaxClNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneMaxCl");
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

	// html태그 제거
	public static String removeHtmlTag(String html) {
		if (html == null || html.trim().length() == 0) {
			return "";
		}
		return html.replaceAll("<[^>]*>", "");
	}

}
