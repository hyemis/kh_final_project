package kh.com.job.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.service.AdBusinessService;
import kh.com.job.business.model.dto.BsRecruitDetailDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;
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
		
		
		//받은 게시글 정보로 게시글 상세 정보 조회
		BsRecruitDetailDto redto = service.viewDetail(raNum);
		
		mv.addObject("pnum", pnum);
		mv.addObject("search", search);
		mv.addObject("id", raNum);
		mv.addObject("recruit", redto);
		
		return mv;
	}
	
	@PostMapping("/admissChange")
	@ResponseBody
	public int admissChange(ModelAndView mv
			, @RequestParam(name = "raNum", required = false) String raNum
			, @RequestParam(name = "raAdmission", required = false) String raAdmission
			) {
		int result = -1;
		
		Map<String, String> map = new HashMap<>();
		map.put("raNum", raNum);
		map.put("raAdmission", raAdmission);
		
		result = service.admissChange(map);
		
		return result;
	}

}
