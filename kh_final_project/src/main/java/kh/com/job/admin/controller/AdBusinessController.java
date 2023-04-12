package kh.com.job.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.service.AdBusinessService;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.common.page.Paging;

@Controller
@RequestMapping("/admin/business")
public class AdBusinessController {
	
	@Autowired
	private AdBusinessService service;
	
	@GetMapping("/main")
	public ModelAndView adminRecruit(ModelAndView mv
			, @RequestParam(name = "pnum", defaultValue = "1") int pnum
			, @RequestParam(name = "search", required = false) String search 
			) {

		//전체 공고
		List<BsRecruitDto> allList = service.recruitAllList();
		
		Paging list = service.pageList(search, pnum);
		
		mv.addObject("allList", allList);
		mv.addObject("list", list);
		return mv;
	}

}
