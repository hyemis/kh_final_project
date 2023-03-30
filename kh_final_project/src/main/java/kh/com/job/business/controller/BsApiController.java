package kh.com.job.business.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.service.BsService;
import kh.com.job.common.OpenApiUtils;

@Controller
public class BsApiController {
	
	@Autowired
	private BsService service;
	
	@Autowired
	private OpenApiUtils util;
	
	@GetMapping("/workApi")
	public ModelAndView viewWorkApi(ModelAndView mv) throws Exception{
		List<BsRecruitDto> bsList = util.worknetApi();
		System.out.println(bsList);
		mv.setViewName("business/api/workApi");
		return mv;
    }
	
	// 워크넷API - DB저장
	@PostMapping("/workApi")
	public ModelAndView workApi(ModelAndView mv, BsRecruitDto dto) throws Exception{
		service.apiInsert(dto);
		return mv;
	}
	
	
	
	
}