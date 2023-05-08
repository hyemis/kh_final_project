package kh.com.job.business.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsApplicantResumeDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsSearchDto;
import kh.com.job.business.model.dto.BsSuggestDto;
import kh.com.job.business.model.service.BsAccountService;
import kh.com.job.business.model.service.BsApplicantService;
import kh.com.job.business.model.service.BsRecruitService;
import kh.com.job.business.model.service.BsSearchService;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingAplicantDto;
import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsClDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.dto.PsUnivDto;

@Controller
@RequestMapping("/business/search")
public class BsSearchController {
	
	@Autowired
	private BsRecruitService brService;
	
	@Autowired
	private BsSearchService bsService;
	
	@Autowired
	private BsAccountService baService;
	

	@GetMapping("/suggest")
	public ModelAndView category(ModelAndView mv, BsSearchDto sdto, Principal principal) {
	
		//직종선택 :직업코드('JN')가져오기
		mv.addObject("JNlist", brService.getCateList("JN"));
		//경력선택
		mv.addObject("CAlist", brService.getCateList("CA"));
		//학력선택
		mv.addObject("EDlist", brService.getCateList("ED"));
		//성별선택
		mv.addObject("SElist", brService.getCateList("SE"));
		//로그인한 계정 정보
		mv.addObject("info",baService.viewAccount(principal.getName()));
		//공고리스트
		mv.addObject("recruit",bsService.getRecruit(principal.getName()));
		
		return mv;
	}
	
	//검색결과
	@PostMapping("/search")
	@ResponseBody
	public Paging searchResume(
	       @RequestParam(name = "jobType", required = false, defaultValue = "") String jobType,
	       @RequestParam(name = "career", required = false, defaultValue = "") String career,
	       @RequestParam(name = "education", required = false, defaultValue = "") String education,
	       @RequestParam(name = "gender", required = false, defaultValue = "") String gender, 
	 	   @RequestParam(name = "page", required = false, defaultValue = "1") String page) {

	        BsSearchDto dto = new BsSearchDto();
	        dto.setJobType(jobType);
	        dto.setCareer(career);
	        dto.setEducation(education);
	        dto.setGender(gender);

	        dto.setPnum(Integer.parseInt(page));
	        
	        Paging list = bsService.pagingResumeList(dto);
	        
	        return list;
	    }
	
	@PostMapping("/suggestForm")
	public ModelAndView insertNewsletter(ModelAndView mv, BsSuggestDto dto, Principal principal, RedirectAttributes rttr)  {
		dto.setBsUser(principal.getName()); 
		bsService.suggest(dto);
		mv.setViewName("redirect:/business/search/suggest");
		rttr.addFlashAttribute("msg", "면접제안 완료");
		System.out.println(dto);
		return mv;
	}
	
	



}

