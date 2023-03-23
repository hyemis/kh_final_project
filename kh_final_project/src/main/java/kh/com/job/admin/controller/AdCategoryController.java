package kh.com.job.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.service.AdCategotyService;

@Controller
@RequestMapping("/admin/category")
public class AdCategoryController {
	
	@Autowired
	private AdCategotyService service;
	
	@GetMapping("/main")
	public ModelAndView categoryMain(ModelAndView mv){
		mv.addObject("fdeptList", service.cateFdeptList());
		
		
		return mv;
	}

}
