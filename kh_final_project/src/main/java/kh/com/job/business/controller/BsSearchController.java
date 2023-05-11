package kh.com.job.business.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.business.model.dto.BsAnnounceDto;
import kh.com.job.business.model.dto.BsSearchDto;
import kh.com.job.business.model.dto.BsSuggestDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.dto.InterviewDto;
import kh.com.job.business.model.service.BsAccountService;
import kh.com.job.business.model.service.BsRecruitService;
import kh.com.job.business.model.service.BsSearchService;
import kh.com.job.common.mail.MailUtil;
import kh.com.job.common.page.Paging;
import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.service.PsResumeService;

@Controller
@RequestMapping("/business/search")
public class BsSearchController {
	
	@Autowired
	private BsRecruitService brService;
	
	@Autowired
	private BsSearchService bsService;
	
	@Autowired
	private BsAccountService baService;
	
	@Autowired
	private PsResumeService rservice;
	
	
	//인재 찾기 페이지
	@GetMapping("/suggest")
	public ModelAndView category(ModelAndView mv, BsSearchDto sdto, PsResumeDto rdto, Principal principal) {
		
		//검색을 위한 학력, 경력 업데이트 하기
		rservice.updateResume(rdto);
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
	
	//인재검색 결과
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
	
	//면접 제안
	@PostMapping("/suggestForm")
	public ModelAndView suggestForm(ModelAndView mv, BsSuggestDto dto, Principal principal, RedirectAttributes rttr)  {
		dto.setBsUser(principal.getName()); 
		bsService.suggest(dto);
		mv.setViewName("business/search/suggest");
		rttr.addFlashAttribute("msg", "면접제안 완료");
		System.out.println(dto);
		return mv;
	}
	
		
	//면접 일정 등록페이지
	@GetMapping("/interview")
	public ModelAndView interview(ModelAndView mv,
										@RequestParam(name = "no", required = false) int sgNo) {
		
		BsSuggestDto dto = bsService.interview(sgNo);
		mv.addObject("info", dto);
		
		return mv;
	}
	
	//면접 일정 등록
	@PostMapping("/sendinterview")
	public ModelAndView insertNewsletter(ModelAndView mv, InterviewDto dto, BsAnnounceDto adto,  BsSuggestDto sdto, Principal principal, Integer baNum ) {
		//면접일정등록
		dto.setBsUser(principal.getName());
		bsService.addInterview(dto); 
		System.out.println(dto);
		//면접등록완료
		bsService.updateSend(sdto); 
		System.out.println(sdto);
		//메일발송
		BsUserDto bdto = baService.viewAccount(principal.getName());
		int result = -1;
		result = bsService.resultUpdate(adto);
		if(result>0) {
			int ccNum = 0;
			String[] cc = new String[ccNum]; 
			int successMail = MailUtil.mailSend(adto.getResultTitle(), bdto.getUserEmail(), adto.getResultContent(), adto.getUserEmail(), cc, ccNum);
		}

		mv.setViewName("redirect:/business/search");
		return mv;
	}
	
}
