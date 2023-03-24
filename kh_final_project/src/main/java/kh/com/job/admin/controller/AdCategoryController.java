package kh.com.job.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.admin.model.service.AdCategotyService;

@Controller
@RequestMapping("/admin/category")
public class AdCategoryController {
	
	@Autowired
	private AdCategotyService service;
	
	@GetMapping("/main")
	public ModelAndView categoryMain(ModelAndView mv){
		mv.addObject("fdeptList", service.cateFdeptList());
		
		
		return mv;
	}
	
	// 성공 1 실패 -1
	@PostMapping("/addfcate")
	@ResponseBody
	public int addFirstCategory(ModelAndView mv, AdCategoryDto dto){
		
		int result = -1;
		int idCheck = 1;
		
		dto.setCategoryId(dto.getCategoryId().toUpperCase());
		
		idCheck = service.categoryCheck(dto.getCategoryId());
		
		if(idCheck < 1) {
			result = service.addFirstCategory(dto);
		}
		
		
		return result;
	}

}
