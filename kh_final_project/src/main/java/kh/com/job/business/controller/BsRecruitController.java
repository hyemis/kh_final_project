package kh.com.job.business.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.admin.model.service.AdCategotyService;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.service.BsAccountService;
import kh.com.job.business.model.service.BsRecruitService;

@Controller
@RequestMapping("/business/recruit")
public class BsRecruitController {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private BsRecruitService service;
	
	@Autowired
	private BsAccountService acservice;
	
	@Autowired
	private AdCategotyService adservice;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv, Principal principal) {
		
		if(principal == null) {
			mv.setViewName("redirect:/person/login");
			return mv;
		}
		
		BsUserDto dto = acservice.viewAccount(principal.getName());
		
		mv.addObject("userinfo", dto);
		
		return mv;
	}

	@GetMapping("/insert")
	public ModelAndView recruitInsertRecruit(ModelAndView mv) {
		
		//직업 코드 타입 ('JN')가져오기
		mv.addObject("JNlist", service.getCateList("JN"));
		mv.addObject("CAlist", service.getCateList("CA"));
		
		
		return mv;
	}
	
	@PostMapping("/catelist")
	@ResponseBody
	public String listMiddleCate(ModelAndView mv, String categoryId){
		
		List<AdCategoryDto> mlist = null;
		
		if(!categoryId.isEmpty() && !categoryId.equals("")){
			mlist = adservice.cateMdeptList(categoryId);
		}

		return new Gson().toJson(mlist);
	}
	
	
	
	//나중에
	@GetMapping("/first")
	public ModelAndView recruitInsertFirst(ModelAndView mv) {
		
		return mv;
	}
	
	
	@GetMapping("/second")
	public ModelAndView recruitInsertSecond(ModelAndView mv) {
		
		return mv;
	}
	
	@GetMapping("/third")
	public ModelAndView recruitInsertThird(ModelAndView mv) {
		
		return mv;
	}

	@GetMapping("/fourth")
	public ModelAndView recruitInsertFourth(ModelAndView mv) {
		
		return mv;
	}

	@GetMapping("/fifth")
	public ModelAndView recruitInsertFifth(ModelAndView mv) {
		
		return mv;
	}
}
