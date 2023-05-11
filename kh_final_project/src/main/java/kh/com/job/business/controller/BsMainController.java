package kh.com.job.business.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dto.BsAplicantRecruitDto;
import kh.com.job.business.model.dto.BsSuggestDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.board.model.service.BoardService;
import kh.com.job.business.model.service.BsAboutUsService;
import kh.com.job.business.model.service.BsAccountService;
import kh.com.job.business.model.service.BsApplicantService;
import kh.com.job.business.model.service.BsSearchService;
import kh.com.job.common.page.Paging;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("/business")
public class BsMainController {
	
	@Autowired
	private PsService pservice;
	
	@Autowired
	private BsAboutUsService auservice;
	
	@Autowired
	private BsAccountService acservice;
	
	@Autowired
	private BsApplicantService apservice;

	@Autowired
	private BsSearchService bsService;
	
	//메인창
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		
		return mv;
	}
	
	//공고관리
		@GetMapping("/recruit")
		public ModelAndView recruitdls(ModelAndView mv) {
			
			return mv;
		}
	
	//지원자관리
	@GetMapping("/applicant")
	public ModelAndView applicant(ModelAndView mv, Principal principal) {
		
		if(principal == null) {
			mv.setViewName("redirect:/person/login");
			return mv;
		}
		
		List<BsAplicantRecruitDto> recruitlist = apservice.recruitList(principal.getName());
		
		BsUserDto dto = acservice.viewAccount(principal.getName());
		//총지원자
		int aplicantAll = apservice.aplicantAll(principal.getName());
		//합격
		int passCount = apservice.passCount(principal.getName());
		//불합격
		int failCount = apservice.failCount(principal.getName());
		//진행중
		int proceedCount = apservice.proceedCount(principal.getName());
		
		mv.addObject("aplicantAll", aplicantAll);
		mv.addObject("passCount", passCount);
		mv.addObject("failCount", failCount);
		mv.addObject("proceedCount", proceedCount);
		mv.addObject("recruitlist", recruitlist);
		mv.addObject("userinfo", dto);
		
		return mv;
	}
	
	//인재관리	
	@GetMapping("/search")
	public ModelAndView search(ModelAndView mv, Principal principal, BsSuggestDto dto) {
		
		//로그인한 id로 조회
				dto.setBsUser(principal.getName());
						
				//페이징시, 페이지값(pnum) 0일 때, 기본값 1로 설정
								if(dto.getPnum() < 1) {
								dto.setPnum(1);
								}
								Paging list = bsService.bsSuggestList(dto);
								System.out.println(dto);
												
								mv.addObject("suggest", list);		
				return mv;
	}
	
		
	//내기업관리
	@GetMapping("/aboutus")
	public ModelAndView aboutUs(ModelAndView mv, BoardDto dto, Principal principal) {
		System.out.println("로그인한 아이디" + principal.getName());
		//조회될 회원아이디
		dto.setUserId(principal.getName()); 
		//페이징시, 페이지값(pnum) 0일 때, 기본값 1로 설정
		if(dto.getPnum() < 1) {
		dto.setPnum(1);
		}
		Paging list = auservice.newsLetterList(dto);
		System.out.println(dto);
		mv.addObject("news", list);		
		
		mv.addObject("userinfo",acservice.viewAccount(principal.getName()));
		mv.addObject("companyinfo",auservice.checkInfo(principal.getName()));
		
		return mv;
	}
	


		
	
}
