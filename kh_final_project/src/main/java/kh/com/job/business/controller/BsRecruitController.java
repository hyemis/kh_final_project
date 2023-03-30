package kh.com.job.business.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.service.BsRecruitService;

@Controller
@RequestMapping("/business/recruit")
public class BsRecruitController {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private BsRecruitService service;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv, Principal principal) {
		
		if(principal == null) {
			mv.setViewName("redirect:/person/login");
			return mv;
		}
		
		BsUserDto dto = service.viewAccount(principal.getName());
		
		mv.addObject("userinfo", dto);
		
		return mv;
	}
	
	

	@GetMapping("/first")
	public ModelAndView recruitInsertFirst(ModelAndView mv) {
		
		return mv;
	}
	
	
	@GetMapping("/second")
	public ModelAndView recruitInsertSecond(ModelAndView mv) {
		
		return mv;
	}
	
	@GetMapping("/third")
	public ModelAndView recruitInsertThird(ModelAndView mv) {
		
		return mv;
	}

	@GetMapping("/fourth")
	public ModelAndView recruitInsertFourth(ModelAndView mv) {
		
		return mv;
	}

	@GetMapping("/fifth")
	public ModelAndView recruitInsertFifth(ModelAndView mv) {
		
		return mv;
	}
}
