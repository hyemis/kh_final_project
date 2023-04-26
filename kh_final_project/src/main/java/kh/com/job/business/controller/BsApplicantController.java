package kh.com.job.business.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Sets.SetView;
import com.google.gson.Gson;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsAppInfoDto;
import kh.com.job.business.model.dto.BsApplicantResumeDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.dto.InterviewDto;
import kh.com.job.business.model.service.BsAccountService;
import kh.com.job.business.model.service.BsApplicantService;
import kh.com.job.business.model.service.BsRecruitService;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingAplicantDto;
import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsClDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsUnivDto;
import kh.com.job.person.model.dto.PsUserDto;

@Controller
@RequestMapping("/business/applicant")
public class BsApplicantController {
	
	@Autowired
	private BsApplicantService apservice;
	
	@Autowired
	private BsAccountService acservice;
	
	@Autowired
	private BsRecruitService rcservice;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	

	//합격자관리
	@GetMapping("/pass")
	public ModelAndView pass(ModelAndView mv) {
			
		return mv;
	}
	
	//면접 일정관리  보기
	@GetMapping("/interview")
	public List<InterviewDto> calendar(Principal principal) {
		  List<InterviewDto> list = apservice.viewInterview(principal.getName());
		  return list;
	}
	// 캘린더 event get
	@PostMapping("/interview")
	@ResponseBody
	public String getCalendar(Principal principal) {
	    List<InterviewDto> interviewList = apservice.viewInterview(principal.getName());
	    return new Gson().toJson(interviewList);
	}
	//일정 등록
	@PostMapping("/calendar")
	@ResponseBody
	public String insertInterview(InterviewDto dto, Principal principal) {
		dto.setUserId(principal.getName());
		apservice.insertInterview(dto);
		
		List<InterviewDto> interviewList = apservice.viewInterview(principal.getName());
		return new Gson().toJson(interviewList);
	}
	
	//지원자관리
	@GetMapping("/view")
	public ModelAndView aplicantview(ModelAndView mv, Principal principal
			, PagingAplicantDto pdto) {
		
		List<BsRecruitDto> recruitTitle = apservice.recruitTitle(principal.getName());
		if(pdto.getPnum() == 0) {
			pdto.setPnum(1);
		}
		
		Paging list = apservice.pageList(pdto);
		
		mv.addObject("title", recruitTitle);
		mv.addObject("list", list);
		mv.addObject("pdto", pdto);
		
		return mv;
	}
	//지원자 이력서 확인
	@GetMapping("/resume")
	public ModelAndView applicantResume(ModelAndView mv, Principal principal
			, PagingAplicantDto pdto
			, @RequestParam(name = "resumeNo", required = false, defaultValue = "0") Integer resumeNo
			, @RequestParam(name = "id", required = false, defaultValue = "0") Integer baNum) {
		
		if(resumeNo == 0 || resumeNo == null) {
			mv.setViewName("redirect:view");
			return mv;
		}
		
		BsApplicantResumeDto ardto = apservice.applicantResume(resumeNo);
		// 학력사항 정보 출력 
		List<PsHschoolDto> high = apservice.highSelectList(resumeNo);
		List<PsUnivDto> uni = apservice.uniSelectList(resumeNo);
		List<PsGschoolDto> grad = apservice.gradSelectList(resumeNo);
		
		// 경력사항 정보 출력 
		List<PsCareerDto> career = apservice.carSelectList(resumeNo);
		
		// 자격증 정보 출력
		List<PsCertiDto> certi = apservice.certiSelectList(resumeNo);
		
		// 자기소개서 정보 출력
		PsClDto cl = apservice.clSelectOne(resumeNo);
		
		mv.addObject("resume", ardto);
		mv.addObject("high", high);
		mv.addObject("uni", uni);
		mv.addObject("grad", grad);
		mv.addObject("career", career);
		mv.addObject("certi", certi);
		mv.addObject("cl", cl);
		mv.addObject("baNum", baNum);
		
		return mv;
	}
	
	@GetMapping("/passresume")
	public ModelAndView passResume(ModelAndView mv, Principal principal
			, PagingAplicantDto pdto
			, @RequestParam(name = "applicantResume", required = false, defaultValue = "0") Integer resumeNo
			, @RequestParam(name = "applicantNo", required = false, defaultValue = "0") Integer baNum
			, @RequestParam(name = "applicantId", required = false) String passUserId) {
		
		//기업 회원 계정 정보
		BsAppInfoDto bdto = apservice.userInfo(principal.getName());
		//지원자 회원 정보
		BsAppInfoDto pudto = apservice.userInfo(passUserId);
		
		//경력 카테고리
		mv.addObject("PTlist", rcservice.getCateList("PT"));
		
		mv.addObject("bdto", bdto);
		mv.addObject("pudto", pudto);
		mv.addObject("resumeNo", resumeNo);
		mv.addObject("baNum", baNum);
		mv.addObject("passUserId", passUserId);
		
		return mv;
	}
	

	


	
}
