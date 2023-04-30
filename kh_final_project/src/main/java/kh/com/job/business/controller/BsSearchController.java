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

	@GetMapping("/suggest")
	public ModelAndView category(ModelAndView mv, BsSearchDto sdto) {
		
		//직종선택 :직업코드('JN')가져오기
		mv.addObject("JNlist", brService.getCateList("JN"));
		//경력선택
		mv.addObject("CAlist", brService.getCateList("CA"));
		//학력선택
		mv.addObject("EDlist", brService.getCateList("ED"));
		//성별선택
		mv.addObject("SElist", brService.getCateList("SE"));
		
		return mv;
	}
	
	//검색결과
	@PostMapping("/suggest")
	@ResponseBody
	public List<BsSearchDto> searchResume(
	       @RequestParam(name = "jobType", required = false, defaultValue = "") String jobType,
	       @RequestParam(name = "career", required = false, defaultValue = "") String career,
	       @RequestParam(name = "education", required = false, defaultValue = "") String education,
	       @RequestParam(name = "gender", required = false, defaultValue = "") String gender) {

	        BsSearchDto dto = new BsSearchDto();
	        dto.setJobType(jobType);
	        dto.setCareer(career);
	        dto.setEducation(education);
	        dto.setGender(gender);

	        List<BsSearchDto> list = bsService.resumeList(dto);
	        
	        return list;
	    }

//	@GetMapping("/suggest")
//	@ResponseBody
//	public List<BsSearchDto> searchResume( 
//			ModelAndView mv, BsSearchDto sdto,
//			@RequestParam(name = "jobType", required = false, defaultValue = "") String jobType,
//			@RequestParam(name = "career", required = false, defaultValue = "") String career,
//			@RequestParam(name = "education", required = false, defaultValue = "") String education,
//			@RequestParam(name = "gender", required = false, defaultValue = "") String gender) {
//		
//		mv.addObject("JNlist", brService.getCateList("JN"));
//		mv.addObject("CAlist", brService.getCateList("CA"));
//		mv.addObject("EDlist", brService.getCateList("ED"));
//		mv.addObject("SElist", brService.getCateList("SE"));
//		
//		BsSearchDto dto = new BsSearchDto();
//		dto.setJobType(jobType);
//		dto.setCareer(career);
//		dto.setEducation(education);
//		dto.setGender(gender);
//		
//		List<BsSearchDto> list = bsService.resumeList(dto);
//		
//		return list;
//	}
	
	
	



}

