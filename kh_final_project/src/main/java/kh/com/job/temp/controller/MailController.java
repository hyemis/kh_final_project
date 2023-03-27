package kh.com.job.temp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/temp")
public class MailController {
	
	@GetMapping("/sendmail")
	public ModelAndView SendMailTest(ModelAndView mv) {
		
		return mv;
	}

}
