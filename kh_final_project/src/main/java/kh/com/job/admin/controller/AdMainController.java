package kh.com.job.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.Getter;

@Controller
@RequestMapping("/admin")
public class AdMainController {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		return mv;
	}
	

}
