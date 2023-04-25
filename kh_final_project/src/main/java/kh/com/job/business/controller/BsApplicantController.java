package kh.com.job.business.controller;

import java.security.Principal;
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
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingAplicantDto;

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
	
	//면접 캘린더 보기
	@GetMapping("/interview")
	public ModelAndView calendar(ModelAndView mv, InterviewDto dto, Principal principal) {
		List<InterviewDto> list = apservice.viewInterview(principal.getName());
		
		mv.addObject("view", list);
		return mv;
	}

	//일정 등록
	@PostMapping("/calendar")
	@ResponseBody
	public String insertInterview(InterviewDto dto, Principal principal) {

		dto.setUserId(principal.getName());
		apservice.insertInterview(dto);

		return "redirect:/business/applicant/interview";

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
	
	@GetMapping("/resume")
	public ModelAndView aplicantResume(ModelAndView mv, Principal principal
			, PagingAplicantDto pdto) {
		
		
		
		return mv;
	}

	


	
}
