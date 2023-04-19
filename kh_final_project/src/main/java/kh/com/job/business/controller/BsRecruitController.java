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
import kh.com.job.admin.model.service.AdBusinessService;
import kh.com.job.admin.model.service.AdCategotyService;
import kh.com.job.business.model.dto.BsRecruitDetailDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.service.BsAccountService;
import kh.com.job.business.model.service.BsRecruitService;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingInfoDto;
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
	
	@Autowired
	private AdBusinessService abs;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv, Principal principal) {
		
		if(principal == null) {
			mv.setViewName("redirect:/person/login");
			return mv;
		}
		
		BsUserDto dto = acservice.viewAccount(principal.getName());
		
		//메인 진행중인 리스트
		List<BsRecruitDto> reCruitDto = service.recruitProgress(principal.getName());
		//관리자 미승인 리스트
		List<BsRecruitDto> admissionDto = service.recruitAdmission(principal.getName());
		
		mv.addObject("userinfo", dto);
		mv.addObject("recruitList", reCruitDto);
		mv.addObject("admissionList", admissionDto);
		
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
		dto.setSalary(dto.getMinSalary()+"만원 ~ "+dto.getMaxSalary()+"만원");
		//이력서 파일 업로드
		if(uploadReport != null && !uploadReport.isEmpty()) {
			String reportUrl = service.uploadDocument(uploadReport, principal.getName());
		    dto.setRaExtraDocument(reportUrl);
		}
		
		//모집분야 상위 분류만 선택 할때 모집분야 상위분류로 넣기
		if(dto.getRecruitType().equals("0")) {
			dto.setRecruitType(category2dept);
		}

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
	
	@PostMapping("/changeAdmission")
	@ResponseBody
	public int changeAdmission(BsRecruitDto dto
			){
		int result = -1;
		
		result = service.changeAdmission(dto);
		
		return result;
	}
	
	//전체 공고 리스트
	@GetMapping("/recruitAll")
	public ModelAndView adminRecruit(ModelAndView mv
			,PagingInfoDto pidto
			,Principal principal
			) {
		
		System.out.println(pidto.getPnum() + "정보확인 ");
		//페이징 할 때 pnum값 0일 때
		if(pidto.getPnum() < 1) {
			pidto.setPnum(1);
		}
		System.out.println(pidto.getPnum() + "정보확인2 ");
		pidto.setUserId(principal.getName());
		//페이지네이션 처리가 완료된 리스트
		Paging list = service.recruitAll(pidto);
		System.out.println(pidto);
		mv.addObject("list", list);
		//현재 페이지 정보를 가져오기 위한 addObject
		mv.addObject("pidto", pidto);
		
		return mv;
	}
	//공고 상세
	@GetMapping("/view")
	public ModelAndView viewRecruit(ModelAndView mv
			,PagingInfoDto pidto
			, @RequestParam(name = "id", required = false) String raNum
			,Principal principal
			) {

		BsRecruitDetailDto redto = abs.viewDetail(raNum);
		
		if(redto.getConditionType() != null) {
			String conditionType = redto.getConditionType();
			//join으로 합친거 자르기위한 거
			String[] conditionList = conditionType.split(",");
			List<String> ctList = Arrays.asList(conditionList);			
			mv.addObject("ctList", ctList);
		}
		
		//우대조건
		mv.addObject("SClist", service.getCateList("SC"));
		
		
		mv.addObject("pidto", pidto);
		mv.addObject("redto", redto);
		
		return mv;
	}
	
	//공고 수정
	@GetMapping("/update")
	public ModelAndView updateRecruit(ModelAndView mv
			,PagingInfoDto pidto
			, @RequestParam(name = "id", required = false) String raNum
			,Principal principal
			) {
		
		BsRecruitDetailDto redto = abs.viewDetail(raNum);
		
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
		
		if(redto.getConditionType() != null) {
			String conditionType = redto.getConditionType();
			//join으로 합친거 자르기위한 거
			String[] conditionList = conditionType.split(",");
			List<String> ctList = Arrays.asList(conditionList);			
			mv.addObject("ctList", ctList);
		}
		
		
		mv.addObject("pidto", pidto);
		mv.addObject("redto", redto);
		
		return mv;
	}
	


}
