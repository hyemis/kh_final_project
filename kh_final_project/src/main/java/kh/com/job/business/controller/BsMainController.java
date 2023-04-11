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
	
		
	//내기업관리
	@GetMapping("/aboutus")
	public ModelAndView aboutUs(ModelAndView mv) {
		
		return mv;
	}
	

		
		
		
	//test페이지 나중에 삭제	
		@GetMapping("/test")
		public ModelAndView test(ModelAndView mv) {
					
			return mv;
		}
		
	
}
