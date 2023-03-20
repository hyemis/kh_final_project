package kh.com.job.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.service.AdService;
import kh.com.job.person.model.dto.PsUserDto;

@RequestMapping("/admin/account")
public class AdAccountController {
	
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private AdService service;
	
	@GetMapping("/manage")
	public ModelAndView accountmgr(ModelAndView mv, PsUserDto dto) {
		
		
		mv.addObject("accdto", service.accountmgr());
		
		return mv;
	}
	
	@GetMapping("/create")
	public ModelAndView create(ModelAndView mv){
		
		
		
		return mv;
	}

}
