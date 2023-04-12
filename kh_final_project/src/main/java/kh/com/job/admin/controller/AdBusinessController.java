package kh.com.job.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.service.AdBusinessService;
import kh.com.job.business.model.dto.BsRecruitDto;

@Controller
@RequestMapping("/admin/business")
public class AdBusinessController {
	
	@Autowired
	private AdBusinessService service;
	
	@GetMapping("/main")
	public ModelAndView adminRecruit(ModelAndView mv) {
		
		//미승인 공고
		List<BsRecruitDto> allList = service.recruitAllList();
		mv.addObject("allList", allList);
		return mv;
	}

}
