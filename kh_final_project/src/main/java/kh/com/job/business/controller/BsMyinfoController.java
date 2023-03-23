package kh.com.job.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/business/myinfo")
public class BsMyinfoController {
		
	@GetMapping("/info")
	public ModelAndView info(ModelAndView mv) {
			
		return mv;
	}
		
	@GetMapping("/infowrite")
	public ModelAndView infoWrite(ModelAndView mv) {
			
		return mv;
	}
}
