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

import com.google.gson.Gson;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.dto.InterviewDto;
import kh.com.job.business.model.service.BsAccountService;
import kh.com.job.business.model.service.BsApplicantService;

@Controller
@RequestMapping("/business/applicant")
public class BsApplicantController {
	
	@Autowired
	private BsApplicantService apservice;
	
	@Autowired
	private BsAccountService acservice;

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
	
	//지원자관리 리스트
	//다른걸로 변경 필요
	@PostMapping("/recruitList")
	@ResponseBody
	public String recruitList(ModelAndView mv
			, @RequestParam(name = "raNum", required = false) int raNum) {
		
		List<BsAplicantDto> apList = apservice.aplicantList(raNum);
		
		
		
		return new Gson().toJson(apList);
	}
	


	
}
