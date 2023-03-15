package kh.com.job.person.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.person.model.dto.PsDto;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("/person")
public class PsController {
	
	@Autowired
	private PsService service;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		
		try {
			mv.addObject("plist", service.selectList());
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return mv;
	}
	
	

}
