package kh.com.job.business.controller;

import java.security.Principal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.admin.model.service.AdCategotyService;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.service.BsAccountService;
import kh.com.job.business.model.service.BsRecruitService;
import kh.com.job.person.model.dto.PsUserDto;

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
		//경력선택
		mv.addObject("CAlist", service.getCateList("CA"));
		//학력선택
		mv.addObject("EDlist", service.getCateList("ED"));
		//우대조건
		mv.addObject("SClist", service.getCateList("SC"));
		//고용형태
		mv.addObject("ETlist", service.getCateList("ET"));
		//상세근무형태
		mv.addObject("HTlist", service.getCateList("HT"));
		
		
		return mv;
	}
	
	@PostMapping("/insert")
	public ModelAndView insertRecruit(ModelAndView mv, BsRecruitDto dto
								,@RequestParam(value = "conditionTypeList", required = false) List<String> conditionTypeList
								,@RequestParam(name = "report", required = false) MultipartFile uploadReport
								,@RequestParam(name = "category2dept", required = false) String category2dept
								,Principal principal){
		
		int result = -1;
		
		if(principal != null) {
			dto.setUserId(principal.getName());
		}
		
		if(conditionTypeList != null && !conditionTypeList.isEmpty()) {
			//우대조건 컬럼 한개로 합치기
			String conditionType = String.join(",", conditionTypeList);
			dto.setConditionType(conditionType);
			
			//join으로 합친거 자르기위한 거
//			String[] conditionType2 = conditionType.split(",");
//			List<String> list = Arrays.asList(conditionType2);			
		}
		
		//salary 최대값 최소값 null일 때 0으로  
		if(dto.getMinSalary() == null || dto.getMinSalary().isEmpty()){
			dto.setMinSalary("0");
		}
		if(dto.getMaxSalary() == null || dto.getMaxSalary().isEmpty()){
			dto.setMaxSalary("0");
		}
		dto.setSalary(dto.getMinSalary()+" ~ "+dto.getMaxSalary());
		//이력서 파일 업로드
		if(uploadReport != null && !uploadReport.isEmpty()) {
			String reportUrl = service.uploadDocument(uploadReport, principal.getName());
		    dto.setRaExtraDocument(reportUrl);
		}
		
		//모집분야 상위 분류만 선택 할때 모집분야 상위분류로 넣기
		if(dto.getRecruitType().equals("0")) {
			dto.setRecruitType(category2dept);
		}
		
		//여기다가 채용공고 내용 넣기
		System.out.println(dto);
		/*
		 * 들어가야할 내용
		 * 회사이름 모집분야 경력선택 학력선택 급여
		 * 우대조건 등록, 마감
		 * 고용 형태
		 * 상세 근무형태
		 * 공고 제목
		 * 공고 내용
		 * 기타 문서
		 */
		result = service.insertRecruit(dto);
		
		if(result == 1) {
			mv.setViewName("redirect:/business/recruit/main");
		}
		
		mv.setViewName("redirect:/business/recruit/main");
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
	
	@PostMapping("/imageUpload")
	@ResponseBody
	public String imageUpload(@RequestParam("upload") MultipartFile file
			, Principal principal
			){
		Map<String, Object> map = new HashMap<>();
		 
		String url = service.uploadDocument(file, principal.getName());		

		map.put("uploaded", 1);
		map.put("url", url);

		return new Gson().toJson(map);
	}
	


}
