package kh.com.job.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.service.AdService;
import kh.com.job.person.model.dto.PsUserDto;
import lombok.Getter;

@Controller
@RequestMapping("/admin")
public class AdMainController {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private AdService service;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		return mv;
	}
	
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		return mv;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(ModelAndView mv) {
		return mv;
	}
	
	@PostMapping("/loginform")
	public ModelAndView loginform(ModelAndView mv) {
		return mv;
	}
	
	@GetMapping("/accountmgr")
	public ModelAndView accountmgr(ModelAndView mv, PsUserDto dto) {
		
		
		mv.addObject("accdto", service.accountmgr());
		
		return mv;
	}

}
