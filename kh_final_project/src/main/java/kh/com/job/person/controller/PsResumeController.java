package kh.com.job.person.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.person.model.service.PsResumeService;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("person/resume")
public class PsResumeController {
	
	@Autowired
	private PsResumeService rservice;
	@Autowired
	private PsService pservice;
	
	
	//
	@GetMapping("/list")
	public ModelAndView doList(ModelAndView mv) {
		return mv;
	}
	
	
	
	// 이력서 페이지 열기 
	@GetMapping("/write")
	public ModelAndView doResume(ModelAndView mv, String userId){
			System.out.println(userId);
		try {
			
			PsUserDto result = pservice.selectOne(userId);
			
			if(result!=null) {
				mv.addObject("userinfo", result);
				mv.setViewName("person/resume/write");
			} else {
				mv.setViewName("redirect:/");
			}
		} 
			catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 이력서 작성
	@PostMapping("/write")
	public ModelAndView writeResume(ModelAndView mv) {
		return mv;
	}
	
	// 예외처리는 프로젝트 후반에 작성 
	

}
