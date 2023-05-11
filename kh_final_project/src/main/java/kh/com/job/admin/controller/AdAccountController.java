package kh.com.job.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.admin.model.dto.AdUserDto;
import kh.com.job.admin.model.service.AdAccountService;
import kh.com.job.person.model.dto.PsUserDto;

@Controller
@RequestMapping("/admin/account")
public class AdAccountController {
	
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private AdAccountService service;
	
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
			
//			passwordEncoder.matches(rawPassword, encodedPassword);
			dto.setUserPw(passwordEncoder.encode(dto.getUserPw()));
			result = service.insertAccount(dto);
			mv.setViewName("redirect:/admin/account/manage");
		}
		
		return mv;
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public int deleteAccount(ModelAndView mv, String userId) {
		int result = -1;
		
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(!userId.equals(auth.getName())) {
			if(!(userId.isEmpty() || userId.equals(""))) {
				result = service.deleteAccount(userId);
			}			
		}else {
			result = 3;
			return result;
		}
		
		
		return result;
	}
	
	// 이건 관리자 마이페이지로 뺄꺼
	@GetMapping("/usercheck")
	public ModelAndView userCheck(ModelAndView mv, String userId) {
		
		mv.addObject("userId", userId);

		return mv;
	}
	
	@PostMapping("/usercheck")
	public ModelAndView userCheckForm(ModelAndView mv,RedirectAttributes rttr, String userPw) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		AdUserDto adto = service.checkUser(auth.getName());
		
		
		if(passwordEncoder.matches(userPw, adto.getUserPw())) {
			mv.setViewName("redirect:/admin/account/update?userId="+auth.getName());
		}else {
			rttr.addFlashAttribute("msg", "계정 확인에 실패했습니다.");
			mv.setViewName("redirect:/admin/main");
		}
		
		return mv;
	}
	
	@GetMapping("/update")
	public ModelAndView accountUpdate(ModelAndView mv, String userId) {;
		
		AdUserDto dto = service.selectUser(userId);
		
		mv.addObject("addto", dto);
		
		return mv;
	}
	
	@PostMapping("/update")
	public ModelAndView accountConfirm(ModelAndView mv,RedirectAttributes rttr, AdUserDto dto) {;
	
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	
	int result = -1;
	
	if(!(dto.getUserPw().isEmpty() || dto.getUserPw().equals(""))) {
		dto.setUserPw(passwordEncoder.encode(dto.getUserPw()));
	}
	
	result = service.updateManager(dto);
	
	if(result != 1) {
		rttr.addFlashAttribute("addto", dto);
		rttr.addFlashAttribute("masage", "실패 했습니다.처음 부터 다시해 주세요");
		mv.setViewName("redirect:/admin/account/update?userId="+dto.getUserId());
	}else {
		if(auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_AM"))) {
			mv.setViewName("redirect:/admin/account/manage");			
		}else {
			mv.setViewName("redirect:/admin/main");
		}
	}
	

	return mv;
	}


}
