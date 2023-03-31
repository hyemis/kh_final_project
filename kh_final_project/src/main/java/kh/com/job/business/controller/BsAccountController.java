package kh.com.job.business.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.service.BsAccountService;


@Controller
@RequestMapping("/business/account")
public class BsAccountController {

	// 암호화 기능 가지고 있는 클래스 자동주입
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private BsAccountService service;

/*	기본형
	@GetMapping("/url")
	public ModelAndView 해당컨트롤러에서 사용할이름(ModelAndView mv, BsUserDto dto,
		return mv;
	}
*/	
	//회원정보 불러오기
	@GetMapping("/info")
	public ModelAndView viewinfo(ModelAndView mv, BsUserDto dto, Principal principal) {
		//로그인한 아이디
		System.out.println(principal.getName());
		
		//jsp에서 불러올 이름 :bsinfo , 불러올값 :service.viewAccount
		mv.addObject("bsinfo",service.viewAccount(principal.getName()));
		return mv;
	}
	
	@GetMapping("/password")
	public ModelAndView updatePw(ModelAndView mv, BsUserDto dto, Principal principal) {
		//로그인한 아이디
		System.out.println(principal.getName());
		
		//jsp에서 불러올 이름 :bsinfo , 불러올값 :service.viewAccount
		mv.addObject("bsinfo",service.getUserPw(principal.getName()));
		return mv;
	}
	
	
	//회원정보 수정
	@PostMapping("/info")
	public ModelAndView update(ModelAndView mv, BsUserDto dto, Principal principal, RedirectAttributes rttr)  {
		dto.setUserId(principal.getName()); 
		service.updateAccount(dto);
		mv.setViewName("redirect:/business/account/info");
		rttr.addFlashAttribute("msg", "회원정보 수정에 성공했습니다.");
		return mv;
	}
	
	// 회원 프로필 이미지 수정처리
//	@PostMapping(value = "/info")
    
	//회원 비밀번호 수정처리
	@PostMapping("/password")
	public ModelAndView updatePw(ModelAndView mv, BsUserDto dto, Principal principal, RedirectAttributes rttr)  {

		if(principal.getName()!= null) {
			dto.setUserId(principal.getName());
			dto.setUserPw(passwordEncoder.encode(dto.getUserPw())); // 패스워드 암호화
			service.updatePassword(dto);
			mv.setViewName("redirect:/business/account/info");
			rttr.addFlashAttribute("msg", "비밀번호변경에 성공했습니다.");
		}else {
			mv.setViewName("redirect:/");
			rttr.addFlashAttribute("msg", "비밀번호변경에 실패했습니다.");
		}
		return mv;
	}	

	
	
	
	
	
}
