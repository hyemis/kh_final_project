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
	
	public List<PsHschoolDto> highSelectList(Map<String, Object> infoMap) throws Exception {
		return sqlSession.selectList("resume.highSelectList", infoMap);
	}

	public  List<PsUnivDto> uniSelectList(Map<String, Object> infoMap) throws Exception {
		return sqlSession.selectList("resume.uniSelectList", infoMap);
	}
	
	public  List<PsGschoolDto> gradSelectList(Map<String, Object> infoMap) throws Exception {
		return sqlSession.selectList("resume.gradSelectList", infoMap);
	}
	
	public List<PsCareerDto> carSelectList(Map<String, Object> infoMap) throws Exception {
		return sqlSession.selectList("resume.carSelectList", infoMap);
	}
	
	public List<PsCertiDto> certiSelectList(Map<String, Object> infoMap) throws Exception {
		return sqlSession.selectList("resume.certiSelectList", infoMap);
	}
	
	public PsClDto clSelectOne(Map<String, Object> infoMap) throws Exception { 
		return sqlSession.selectOne("resume.clSelectOne", infoMap);
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
	
	//이력서 수정
	public int update(PsResumeDto dto) throws Exception {
		return sqlSession.update("resume.update", dto);
	}
	//학력,경력 업데이트
	public int updateResume(PsResumeDto dto) {
		return sqlSession.update("resume.updateResume", dto);
	}
	
	// 이력서 삭제
	public int delete(int resumeNo) throws Exception {
		return sqlSession.delete("resume.delete", resumeNo);
	}

	// 이력서-고등학교입력
	public int insertHschool(PsHschoolDto dto) throws Exception {
		return sqlSession.insert("resume.insertHschool", dto);
	}

	// 이력서 - 고등학교 삭제
	public int deleteHigh(int highEduNo) throws Exception {
		return sqlSession.delete("resume.deleteHigh", highEduNo);
	}
	
	// 이력서 - 고등학교 수정
	public int updateHigh(Map<String, Object> updateHigh) throws Exception {
		return sqlSession.update("resume.updateHigh", updateHigh);
	}

	// 이력서-대학교입력
	public int insertUniv(PsUnivDto dto) throws Exception {
		return sqlSession.insert("resume.insertUniv", dto);
	}

	// 이력서 - 대학교 삭제
	public int deleteUni(int uniEduNo) throws Exception {
		return sqlSession.delete("resume.deleteUni", uniEduNo);
	}
	
	// 이력서 - 대학교 수정
	public int updateUni(Map<String, Object> updateUni) throws Exception {
		return sqlSession.update("resume.updateUni", updateUni);
	}

	// 이력서-대학원입력
	public int insertGschool(PsGschoolDto dto) throws Exception {
		return sqlSession.insert("resume.insertGschool", dto);
	}

	// 이력서 - 대학원 삭제
	public int deleteGrad(int gradEduNo) throws Exception {
		return sqlSession.delete("resume.deleteGrad", gradEduNo);
	}
	
	// 이력서 - 대학원 수정
	public int updateGrad(Map<String, Object> updateGrad) throws Exception {
		return sqlSession.update("resume.updateGrad", updateGrad);
	}

	// 이력서-경력사항입력
	public int insertCareer(PsCareerDto dto) throws Exception {
		return sqlSession.insert("resume.insertCareer", dto);
	}

	// 이력서 - 경력사항 삭제
	public int deleteCareer(int carNo) throws Exception {
		return sqlSession.delete("resume.deleteCareer", carNo);
	}

	// 이력서 - 경력사항 수정
	public int updateCareer(Map<String, Object> updateCareer) throws Exception {
		return sqlSession.update("resume.updateCareer", updateCareer);
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

	// highinfo 삭제
	public int deleteInfoHigh(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.delete("resume.deleteInfoHigh", InfoNo);
	}

	// 이력서-고등학교 최신보기
	public int getMaxHighNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneMaxHigh");
	}

	// UniInfo - 입력
	public int insertUniInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertUniInfo", InfoNo);
	}

	// UniInfo 삭제
	public int deleteInfoUni(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.delete("resume.deleteInfoUni", InfoNo);
	}

	// 이력서-대학교 최신보기
	public int getMaxUniNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneMaxUni");
	}

	// GradInfo - 입력
	public int insertGradInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertGradInfo", InfoNo);
	}

	// GradInfo 삭제
	public int deleteInfoGrad(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.delete("resume.deleteInfoGrad", InfoNo);
	}

	// 이력서 - 대학원 최신보기
	public int getMaxGradNo() throws Exception {
		return sqlSession.selectOne("resume.selectOneMaxGrad");
	}

	// CareerInfo - 입력
	public int insertCareerInfo(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.insert("resume.insertCareerInfo", InfoNo);
	}

	// 이력서 - 경력info 삭제
	public int deleteInfoCareer(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.delete("resume.deleteInfoCareer", InfoNo);
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
	
	// ClInfo - 확인
	public int checkClInfo(int clNo) throws Exception{
		return sqlSession.selectOne("resume.checkClInfo", clNo);
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
				String dateString = hschool.getHighDate();
				if (dateString != null) {
					LocalDate date = LocalDate.parse(dateString.split(" ")[0]);
					hschool.setHighDate(date.toString());
				}
		}

		return highSchoolList;
	}

	// 대학교 학력사항 보기
	public List<PsUnivDto> selectListUni(String userId) throws Exception {
		List<PsUnivDto> univList = sqlSession.selectList("resume.selectListUni", userId);

	    for (PsUnivDto univ : univList) {
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

	// 자기소개서 파일 삭제
	public int deleteClFile(String fileName) {
		return sqlSession.update("resume.deleteClFile", fileName);
	}
	
	// 자기소개서 info 삭제
	public int deleteInfoCl(Map<String, Object> InfoNo) throws Exception {
		return sqlSession.update("resume.deleteInfoCl", InfoNo);
		
	}

	

}
