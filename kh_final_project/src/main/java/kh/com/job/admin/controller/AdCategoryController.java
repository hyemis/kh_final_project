package kh.com.job.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/category")
public class AdCategoryController {
	
	@GetMapping("/main")
	public ModelAndView categoryMain(ModelAndView mv){
		
		
		
		return mv;
	}

}
