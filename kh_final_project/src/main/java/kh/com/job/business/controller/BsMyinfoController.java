package kh.com.job.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/business/myinfo")
public class BsMyinfoController {
		
	@GetMapping("/companyinfo")
	public ModelAndView info(ModelAndView mv) {
			
		return mv;
	}
		
	@GetMapping("/infowrite")
	public ModelAndView infoWrite(ModelAndView mv) {
			
		return mv;
	}
	
	//회사소개 정보 저장 - 태그, 소개내용, 기업사진
	//@PostMapping("/infowrite")
    //todo
            
    
}
	
	
	