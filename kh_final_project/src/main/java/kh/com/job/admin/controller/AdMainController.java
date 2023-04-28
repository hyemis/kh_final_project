package kh.com.job.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.HomeController;
import kh.com.job.admin.model.dto.AdBannerDto;
import kh.com.job.admin.model.service.AdService;

@Controller
@RequestMapping("/admin")
public class AdMainController {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private AdService service;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		return mv;
	}
	
	@GetMapping("/banner")
	public ModelAndView banner(ModelAndView mv) {
		
		List<AdBannerDto> bList = service.bannerList();
		
		mv.addObject("bList", bList);
		return mv;
	}
	
	@GetMapping("/banner/detail")
	public ModelAndView bannerDetail(ModelAndView mv
			,@RequestParam(name = "id", required = false) int id
			) {
		
		AdBannerDto dto = service.bannerDetail(id);
		
		mv.addObject("detail", dto);
		return mv;
	}

}
