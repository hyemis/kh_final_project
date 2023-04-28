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
	private BsRecruitService brservice;
	
	@Autowired
	private BsSearchService bsservice;
	
	
	@GetMapping("/suggest")
	public ModelAndView category(ModelAndView mv, BsSearchDto sdto) {
		
		//직종선택 :직업코드('JN')가져오기
		mv.addObject("JNlist", brservice.getCateList("JN"));
		//경력선택
		mv.addObject("CAlist", brservice.getCateList("CA"));
		//학력선택
		mv.addObject("EDlist", brservice.getCateList("ED"));
		//성별선택
		mv.addObject("SElist", brservice.getCateList("SE"));
		
		if(sdto.getPnum() == 0) {
			sdto.setPnum(1);
		}
		Paging list = bsservice.resumePageList(sdto);
		
		mv.addObject("list", list);
		mv.addObject("sdto", sdto);
		
		return mv;
	}
	
/*	//검색결과
	@PostMapping("/suggest")
	public ModelAndView findResume(ModelAndView mv, BsSearchDto sdto) {
		
		if(sdto.getPnum() == 0) {
			sdto.setPnum(1);
		}
		Paging list = bsservice.resumePageList(sdto);
		
		mv.addObject("list", list);
		mv.addObject("sdto", sdto);
		
		return mv;
	}
	
*/


}

