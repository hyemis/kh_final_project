
package kh.com.job.board.controller;

import java.security.Principal;
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

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.dto.CompanyDto;
import kh.com.job.board.model.service.BoardService;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.service.BsAboutUsService;
import kh.com.job.business.model.service.BsRecruitService;
import kh.com.job.common.page.Paging;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("/board/company")
public class CompanyController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private BsRecruitService brservice;
	
	@Autowired
	private BsAboutUsService baservice;
	
	@Autowired
	private PsService pservice;

	//회사소개 리스트
	@GetMapping("/companyinfo")
	public ModelAndView companyinfoList(ModelAndView mv, CompanyDto dto) {
		//페이징 할 때 pnum값 0일 때, 기본값 1로 설정
		if(dto.getPnum() < 1) {
		   dto.setPnum(1);
		}
		Paging list = service.companyInfoList(dto);
		System.out.println(dto);
		
		mv.addObject("info", list);
		
		return mv;
	}

	// 회사소개 상세보기
	@GetMapping("/companyinfo/view")
	public ModelAndView viewCompanyinfo(ModelAndView mv,
										@RequestParam(name = "no", required = false) int boardNo) {

		CompanyDto dto = service.companyInfoOne(boardNo);
		mv.addObject("info", dto);

		String userId = dto.getUserId();
		// 진행중인 공고리스트
		List<BsRecruitDto> reCruitDto = brservice.recruitAdmission(userId);
		mv.addObject("recruitList", reCruitDto);

//			List<BoardDto> newsList = baservice.newsLetterList(userId);
//			mv.addObject("news", newsList);

		return mv;
	}
	
//	
	
	//뉴스레터 리스트
	@GetMapping("/newsletter")
	public ModelAndView newsletter(ModelAndView mv, BoardDto dto, Principal principal) {
//		List<BoardDto> list = service.newsletterList(principal.getName());

//		mv.addObject("newsletter", list);

		return mv;
	}
	
	// 뉴스레터 상세보기
		@GetMapping("/newsletter/view")
		public ModelAndView newsletterOne(ModelAndView mv) {
			return mv;
		}

}
