package kh.com.job.temp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.temp.model.service.TempService;

@Controller
public class TempController {
	
	@Autowired
	private TempService service;

	@GetMapping("/member/list")
	public ModelAndView memberList(ModelAndView mv) {
	
		System.out.println("멤버리스트");
	
		
		try {
			mv.addObject("mlist", service.memberList());
		} catch (Exception e) {
			e.printStackTrace();
		} 
	
		return mv;
	}
	
	@GetMapping("/tempPage")
	public ModelAndView tempView(ModelAndView mv) {
		
		System.out.println("템프 페이지");
		
		return mv;
	}
}
