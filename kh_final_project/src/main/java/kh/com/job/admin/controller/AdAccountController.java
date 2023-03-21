package kh.com.job.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.service.AdService;
import kh.com.job.person.model.dto.PsUserDto;

@Controller
@RequestMapping("/admin/account")
public class AdAccountController {
	
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private AdService service;
	
	@GetMapping("/manage")
	public ModelAndView manage(ModelAndView mv, PsUserDto dto) {
		
		
		mv.addObject("accdto", service.accountmgr());
		
		return mv;
	}
	
	@GetMapping("/create")
	public ModelAndView create(ModelAndView mv){
		
		
		
		return mv;
	}
	
	@PostMapping("/create")
	public ModelAndView createAccount(ModelAndView mv, PsUserDto dto){
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(dto.getUserId());
		System.out.println(dto.getUserPw());
		System.out.println(dto.getUserName());
		System.out.println(dto.getUserPhone());
		System.out.println(dto.getUserRole());
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		
		
		mv.setViewName("redirect:/admin/account/manage");
		return mv;
	}

}
