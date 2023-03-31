package kh.com.job.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

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
	
	@PostMapping("/delfcate")
	@ResponseBody
	public int delFirstCategory(ModelAndView mv, AdCategoryDto dto){
		
		int result = -1;
		int reqCheck = 1;

		reqCheck = service.reqCheck(dto);
		
		System.out.println(reqCheck);
		
		if(reqCheck < 1) {
			result = service.delFirstCategory(dto);
		}else if (reqCheck > 1) {
			result = 3;
		}
		
		
		return result;
	}
	
	@PostMapping("/listmcate")
	@ResponseBody
	public String listMiddleCate(ModelAndView mv, String categoryId){
		
		List<AdCategoryDto> mlist = null;
		
		if(!categoryId.isEmpty() && !categoryId.equals("")){
			mlist = service.cateMdeptList(categoryId);
		}

		return new Gson().toJson(mlist);
	}
	
	// 성공 1 실패 -1
	@PostMapping("/addmcate")
	@ResponseBody
	public int addMiddleCategory(ModelAndView mv, AdCategoryDto dto){
		
		int result = -1;
		int idCheck = 1;
		
		dto.setCategoryId(dto.getCategoryId().toUpperCase());
		
		idCheck = service.categoryCheck(dto.getCategoryId());
		
		if(idCheck < 1) {
			result = service.addMiddleCategory(dto);
		}
		
		
		return result;
	}
	//3단계 (마지막 리스트)
	@PostMapping("/listlcate")
	@ResponseBody
	public String listLastCate(ModelAndView mv, String categoryId){
		
		List<AdCategoryDto> llist = null;
		
		if(!categoryId.isEmpty() && !categoryId.equals("")){
			llist = service.cateMdeptList(categoryId);
		}

		return new Gson().toJson(llist);
	}
	
	// 성공 1 실패 -1
	@PostMapping("/addlcate")
	@ResponseBody
	public int addLastCategory(ModelAndView mv, AdCategoryDto dto){
		
		int result = -1;
		int idCheck = 1;
		
		dto.setCategoryId(dto.getCategoryId().toUpperCase());
		
		idCheck = service.categoryCheck(dto.getCategoryId());
		
		if(idCheck < 1) {
			result = service.addLastCategory(dto);
		}
		
		
		return result;
	}

}
