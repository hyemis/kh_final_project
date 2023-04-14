package kh.com.job.business.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.service.BsAboutUsService;

@Controller
@RequestMapping("/business/aboutus")
public class BsAboutUsController {

	@Autowired
	private BsAboutUsService service;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 회원정보 불러오기
	@GetMapping("/")
	public ModelAndView viewinfo(ModelAndView mv, BsUserDto dto, Principal principal) {
		// 로그인한 아이디
		System.out.println(principal.getName());

		// jsp에서 불러올 이름 :bsinfo , 불러올값 :service.viewAccount
		mv.addObject("userinfo", service.viewAccount(principal.getName()));
		return mv;
	}
	
	

	// 뉴스레터 페이지 불러오기
	@GetMapping("/newsletter")
	public ModelAndView newsletter(ModelAndView mv) {
		return mv;
	}

	// Q&A 페이지 불러오기
	@GetMapping("/qna")
	public ModelAndView qna(ModelAndView mv) {
		return mv;
	}
	
	// 뉴스레터 작성
	@PostMapping("/saveNewsletter")
	public ModelAndView update(ModelAndView mv, BoardDto dto, Principal principal, RedirectAttributes rttr)  {
		dto.setUserId(principal.getName()); 
		service.insert(dto);
		mv.setViewName("redirect:/business/aboutus/newsletter");
		rttr.addFlashAttribute("msg", "뉴스레터가 성공적으로 등록되었습니다.");
		return mv;
	}
	
	
	
//	
}
