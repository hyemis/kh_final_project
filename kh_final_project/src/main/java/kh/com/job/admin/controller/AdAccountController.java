package kh.com.job.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public ModelAndView createAccount(ModelAndView mv, PsUserDto dto, RedirectAttributes rttr){
		
		int result = -1;
		int idCheck = 1;
		
		idCheck = service.idCheck(dto.getUserId());
		
		if(idCheck > 0) {
			System.out.println("아이디 중복    " + idCheck);
			rttr.addFlashAttribute("masage", "중복된 아이디 입니다.");
			rttr.addFlashAttribute("admdto", dto);
			mv.setViewName("redirect:/admin/account/create");
		}else {
			dto.setUserPw(passwordEncoder.encode(dto.getUserPw()));
			result = service.insertAccount(dto);
			mv.setViewName("redirect:/admin/account/manage");
		}
		
		return mv;
	}

}
