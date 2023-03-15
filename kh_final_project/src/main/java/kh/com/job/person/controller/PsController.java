package kh.com.job.person.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/person")
public class PsController {
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		return mv;
	}

}
