package kh.com.job.business.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.service.BsAboutUsService;
import kh.com.job.business.model.service.BsAccountService;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingInfoDto;

@Controller
@RequestMapping("/business")
public class BsMainController {
	
	@Autowired
	private BsAboutUsService auservice;
	
	@Autowired
	private BsAccountService buservice;
	
	//메인창
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		
		return mv;
	}
	
	//공고관리
		@GetMapping("/recruit")
		public ModelAndView recruitdls(ModelAndView mv) {
			
			return mv;
		}
	
	//지원자관리
	@GetMapping("/applicant")
	public ModelAndView applicant(ModelAndView mv) {
		
		return mv;
	}
	
	//인재관리	
	@GetMapping("/search")
	public ModelAndView search(ModelAndView mv) {
		
		return mv;
	}
	
		
	//내기업관리
	@GetMapping("/aboutus")
	public ModelAndView aboutUs(ModelAndView mv, BoardDto dto, Principal principal) {
		System.out.println("로그인한 아이디" + principal.getName());
		
//		List<BoardDto> bdto = auservice.listAll(principal.getName());
		List<BoardDto> news = auservice.newsLetterList(principal.getName());
		
//		mv.addObject("boards", bdto);
		mv.addObject("news", news);
		mv.addObject("userinfo",buservice.viewAccount(principal.getName()));
		
		return mv;
	}
	

		
		
		
	//test페이지 나중에 삭제	
		@GetMapping("/test")
		public ModelAndView test(ModelAndView mv) {
					
			return mv;
		}
		
	
}
