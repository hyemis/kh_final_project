package kh.com.job.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/business")
public class BsMainController {
	
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
	
		
	//회사소개
	@GetMapping("/myinfo")
	public ModelAndView myInfo(ModelAndView mv) {
		
		return mv;
	}
	
	//내정보	
		@GetMapping("/account")
		public ModelAndView user(ModelAndView mv) {
			
			return mv;
		}
		
	
}
