package kh.com.job.business.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.service.BsRecruitService;
import kh.com.job.business.model.service.BsSearchService;
import kh.com.job.person.model.dto.PsResumeDto;

@Controller
@RequestMapping("/business/search")
public class BsSearchController {
	
	@Autowired
	private BsRecruitService brservice;
	
	@Autowired
	private BsSearchService bsservice;
	
	@GetMapping("/suggest")
	public ModelAndView category(ModelAndView mv) {
		
		//직종선택 :직업코드('JN')가져오기
		mv.addObject("JNlist", brservice.getCateList("JN"));
		//경력선택
		mv.addObject("CAlist", brservice.getCateList("CA"));
		//학력선택
		mv.addObject("EDlist", brservice.getCateList("ED"));
		//성별선택
		mv.addObject("SElist", brservice.getCateList("SE"));
		
		return mv;
	}
	
	@PostMapping("/suggest")
	public ModelAndView search(ModelAndView mv, PsResumeDto dto, String resumeNo) {
//		List<PsResumeDto> list = bsservice.searchResume;
		
//		mv.addObject("search", list);
		
		
    return mv;
}


}
