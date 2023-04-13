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
		
		//페이지네이션 처리가 완료된 리스트
		Paging list = service.pageList(search, pnum);
		mv.addObject("list", list);
		
		//현재 페이지 정보를 가져오기 위한 addObject
		mv.addObject("pnum", pnum);
		mv.addObject("search", search);
		
		return mv;
	}
	
	//공고 상세 페이지
	@GetMapping("/view")
	public ModelAndView viewRecruit(ModelAndView mv
			, @RequestParam(name = "pnum", defaultValue = "1") int pnum
			, @RequestParam(name = "search", required = false) String search
			, @RequestParam(name = "id", required = false) String raNum
			) {
		
		
		return mv;
	}

}
