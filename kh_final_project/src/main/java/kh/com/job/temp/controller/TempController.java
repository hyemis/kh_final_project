package kh.com.job.temp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.temp.model.service.TempService;

@Controller
@RequestMapping("/temp")
public class TempController {
	
	@Autowired
	private TempService service;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 

	@GetMapping("/list")
	public ModelAndView memberList(ModelAndView mv) {
	
		System.out.println("멤버리스트");
	
		
		try {
			mv.addObject("mlist", service.memberList());
		} catch (Exception e) {
			e.printStackTrace();
		} 
	
		return mv;
	}
	
	@GetMapping("/boardlist")
	public ModelAndView boardList(ModelAndView mv) {
		System.out.println("게시글 리스트");
		
		try {
			mv.addObject("blist", service.boardList());
		} catch (Exception e) {
			e.printStackTrace();
		} 
	
		return mv;
	}
	
	@GetMapping("/applyprocesslist")
	public ModelAndView applyProcessList(ModelAndView mv) {

		
		try {
			mv.addObject("aplist", service.applyProcessList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	@GetMapping("/index")
	public ModelAndView viewIndex(ModelAndView mv) {

		return mv;
	}
	
	@GetMapping("/praticeindex")
	public ModelAndView praticeIndex(ModelAndView mv) {
		
		return mv;
	}
	
	@GetMapping("/praticeadmin")
	public ModelAndView praticeAdmin(ModelAndView mv) {
		
		return mv;
	}
	
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		
		return mv;
	}
	
	@PostMapping("/login")
	public ModelAndView loginForm(ModelAndView mv) {
		
		return mv;
	}
	
	
	
}
