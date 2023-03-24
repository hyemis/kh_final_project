package kh.com.job.business.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.service.AdAccountService;
import kh.com.job.business.model.service.BsInfoService;



@Controller
@RequestMapping("/business/myinfo")
public class BsMyinfoController {
	
	@Autowired
	private BsInfoService service;
	
	//회사소개에 
	@GetMapping("/companyinfo")
	public ModelAndView info(ModelAndView mv) {
		mv.addObject("clist", service.selectList());	
		return mv;
	}
	
	//회사소개 작성페이지
	@GetMapping("/infowrite")
	public ModelAndView infoWrite(ModelAndView mv) {
			
		return mv;
	}
	
	//회사소개 작성
    
}
	
	
	