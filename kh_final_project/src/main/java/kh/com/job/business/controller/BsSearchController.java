package kh.com.job.business.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.business.model.service.BsRecruitService;

@Controller
@RequestMapping("/business/search")
public class BsSearchController {
	
	@Autowired
	private BsRecruitService service;
	
	@GetMapping("/suggest")
	public ModelAndView category(ModelAndView mv) {
		
		//직종선택 :직업코드('JN')가져오기
		mv.addObject("JNlist", service.getCateList("JN"));
		//경력선택
		mv.addObject("CAlist", service.getCateList("CA"));
		//학력선택
		mv.addObject("EDlist", service.getCateList("ED"));
		//성별선택
		mv.addObject("SElist", service.getCateList("SE"));
		
		return mv;
	}
	
	@PostMapping("/search")
	public ModelAndView search(ModelAndView mv) {
		
		return mv;
	}

}
