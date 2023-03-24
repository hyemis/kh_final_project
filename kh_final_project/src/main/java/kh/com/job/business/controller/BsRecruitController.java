package kh.com.job.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/business/recruit")
public class BsRecruitController {

	@GetMapping("/first")
	public ModelAndView recruitInsertFirst(ModelAndView mv) {
		
		return mv;
	}
	
	
	@GetMapping("/second")
	public ModelAndView recruitInsertSecond(ModelAndView mv) {
		
		return mv;
	}
	
	@GetMapping("/third")
	public ModelAndView recruitInsertThird(ModelAndView mv) {
		
		return mv;
	}

	@GetMapping("/fourth")
	public ModelAndView recruitInsertFourth(ModelAndView mv) {
		
		return mv;
	}

	@GetMapping("/fifth")
	public ModelAndView recruitInsertFifth(ModelAndView mv) {
		
		return mv;
	}
}
