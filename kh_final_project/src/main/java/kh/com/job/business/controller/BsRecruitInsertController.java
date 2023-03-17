package kh.com.job.business.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/business/recruitinsert")
public class BsRecruitInsertController {

	@GetMapping("/first")
	public ModelAndView recruitInsert(ModelAndView mv) {
		
		return mv;
	}

}
