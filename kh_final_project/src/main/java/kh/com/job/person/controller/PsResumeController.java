package kh.com.job.person.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.dto.PsUnivDto;
import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.person.model.service.PsResumeService;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("person/resume")
public class PsResumeController {

	@Autowired
	private PsResumeService rservice;
	@Autowired
	private PsService pservice;

	// 이력서관리 페이지 열기
	@GetMapping("/list")
	public ModelAndView doList(ModelAndView mv, Principal principal) {
		try {

			PsUserDto result = pservice.selectOne(principal.getName());
			List<PsResumeDto> resume = rservice.selectList(principal.getName());

			if (result != null) {
				mv.addObject("userinfo", result);
				mv.addObject("resumelist", resume);
				mv.setViewName("person/resume/list");
			} else {
				mv.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 이력서 작성 페이지 열기
	@GetMapping("/write")
	public ModelAndView doResume(ModelAndView mv, Principal principal) {
		try {

			PsUserDto result = pservice.selectOne(principal.getName());
			
			
			if (result != null) {
				mv.addObject("userinfo", result);
				mv.setViewName("person/resume/write");
			} else {
				mv.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 이력서 파일 업로드
	@PostMapping("/fileupload")
	@ResponseBody
	public ModelAndView fileupload(ModelAndView mv, @RequestParam(name = "report", required = false) MultipartFile file,
			Principal principal) throws Exception {

		if (!file.isEmpty()) {
			PsUserDto result = pservice.selectOne(principal.getName());
			if (result != null) {
				String url = rservice.upload(file, principal.getName());
				mv.addObject("url", url);
				mv.addObject("userinfo", result);
			}
		}
		mv.setViewName("person/resume/write");
		return mv;
	}

	// 이력서 작성
	@PostMapping("/write")
	@ResponseBody
	public int writeResume(Principal principal, PsResumeDto dto,
			@RequestParam(name = "uploadPortf", required = false) MultipartFile uploadPortf
			) {

		dto.setUserId(principal.getName());

		if (uploadPortf != null && !uploadPortf.isEmpty()) {
			String portfUrl = rservice.upload(uploadPortf, principal.getName());
			dto.setPortfFile(portfUrl);
		}

		int result = -1;
		try {
			result = rservice.insert(dto);
			
			//TODO: (이력서 고유번호 알아오기 + 고등학교 학력사항 고유번호 알아오기) 고등학교 학력정보 테이블 insert 
			PsResumeDto resume= rservice.selectOne(principal.getName());
			int resumeNo = resume.getResumeNo();
			int highEduNo = rservice.getMaxHighNo();
			
			Map<String, Object> HighInfo = new HashMap<>();
			HighInfo.put("resumeNo", resumeNo);
			HighInfo.put("highEduNo", highEduNo);
			
			// 끼인 테이블 insert 
			rservice.insertHighInfo(HighInfo);
			
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 이력서 삭제
	@PostMapping("/delete")
	public ModelAndView deleteResume(ModelAndView mv, int resumeNo, Principal principal, RedirectAttributes rttr)
			throws Exception {

		int result = rservice.delete(resumeNo);

		if (result > 0) {
			rttr.addFlashAttribute("msg", "이력서가 삭제되었습니다.");

		} else {
			rttr.addFlashAttribute("msg", "이력서 삭제에 실패했습니다.");
		}

		mv.setViewName("redirect:/person/resume/list");
		return mv;
	}

	// 이력서 상세보기 화면
	@GetMapping("/read/{resumeNo}")
	public ModelAndView viewReadResume(ModelAndView mv, Principal principal, @PathVariable int resumeNo)
			throws Exception {
		String userId = principal.getName();

		Map<String, Object> infoMap = new HashMap<>();
		infoMap.put("userId", userId);
		infoMap.put("resumeNo", resumeNo);

		PsUserDto result = pservice.selectOne(userId);
		mv.addObject("userinfo", result);

		PsResumeDto dto = rservice.rselectOne(infoMap);
		mv.addObject("resume", dto);
		mv.setViewName("person/resume/read");
		return mv;
	}

	// TODO 이력서- 학력사항,자격증,경력사항 INSERT

	// 고등학교입력
	@PostMapping("rHSchool")
	public ModelAndView rHschool(ModelAndView mv, PsHschoolDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			result = rservice.insertHschool(dto);

			if (result > 0) {
				rttr.addFlashAttribute("msg", "성공");
			} else {
				rttr.addFlashAttribute("msg", "실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/write");
		return mv;
	}

	// 대학교 입력
	@PostMapping("rUniversity")
	public ModelAndView rUniversity(ModelAndView mv, PsUnivDto dto
			, RedirectAttributes rttr
			) {
		int result = -1;
		try {
			result = rservice.insertUniv(dto);
			
			if (result > 0) {
				rttr.addFlashAttribute("msg", "성공");
			} else {
				rttr.addFlashAttribute("msg", "실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/write");
		return mv;
	}
	
	
	

	// 대학원 입력
	@PostMapping("rGSchool")
	public ModelAndView rGSchool(ModelAndView mv, PsGschoolDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			result = rservice.insertGschool(dto);
			
			if (result > 0) {
				rttr.addFlashAttribute("msg", "성공");
			} else {
				rttr.addFlashAttribute("msg", "실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/write");
		return mv;
	}

	// 경력사항 입력
	@PostMapping("rCareer")
	public ModelAndView rCareer(ModelAndView mv, PsCareerDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			result = rservice.insertCareer(dto);
			
			if (result > 0) {
				rttr.addFlashAttribute("msg", "성공");
			} else {
				rttr.addFlashAttribute("msg", "실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/write");
		return mv;
	}

	// 자격증 입력
	@PostMapping("rCerti")
	public ModelAndView rCerti(ModelAndView mv, PsCertiDto dto, RedirectAttributes rttr) {

		int result = -1;
		try {
			result = rservice.insertCerti(dto);
			
			if (result > 0) {
				rttr.addFlashAttribute("msg", "성공");
			} else {
				rttr.addFlashAttribute("msg", "실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/write");
		return mv;
	}
	
	

	// 예외처리는 프로젝트 후반에 작성

}
