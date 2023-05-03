
package kh.com.job.board.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
		//로그인한 사람이 작성자와 같다면
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentUserId = auth.getName();
		mv.addObject("currentUserId", currentUserId);
		
		CompanyDto dto = service.companyInfoOne(boardNo);
		mv.addObject("info", dto);

		String userId = dto.getUserId();
		// 진행중인 공고리스트
		List<BsRecruitDto> reCruitDto = brservice.recruitAdmission(userId);
		mv.addObject("recruitList", reCruitDto);

//	6개만 보여주는 newsletter list 만들기

		return mv;
	}
	
	//회사소개 수정 페이지
	@GetMapping("/companyinfo/update")
	public ModelAndView updateInfoPage(ModelAndView mv, Principal principal,
										 @RequestParam(name = "no", required = false) int boardNo ) {
				
		CompanyDto dto = service.companyInfoOne(boardNo);
		mv.addObject("info", dto);
					
		return mv;
	}	
			
	//회사소개 수정
	@PostMapping("/updateCompanyinfo")
	public ModelAndView updateCompanyinfo(ModelAndView mv, int boardNo, BoardDto dto, Principal principal ) {
		dto.setUserId(principal.getName()); 
		service.updateCompanyInfo(dto);
		mv.setViewName("redirect:/board/company/companyinfo/view?no=" + boardNo);
		return mv;
	}
	
	//뉴스레터 리스트
	@GetMapping("/newsletter")
	public ModelAndView newsletter(ModelAndView mv, CompanyDto dto) {
		//페이징 할 때 pnum값 0일 때, 기본값 1로 설정
		if(dto.getPnum() < 1) {
		dto.setPnum(1);
		}
		
		Paging list = service.newsLetterAll(dto);
		System.out.println(dto);
		mv.addObject("news", list);
		return mv;
	}
	
	// 뉴스레터 상세보기
		@GetMapping("/newsletter/view")
		public ModelAndView newsletterOne(ModelAndView mv, Principal principal,
										  @RequestParam(name = "no", required = false) int boardNo) {
		
		CompanyDto dto = service.newsLetterOne(boardNo);
		mv.addObject("news", dto);	
		
		//로그인한 사람이 작성자와 같다면
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String currentUserId = auth.getName();
		mv.addObject("currentUserId", currentUserId);
		
		return mv;
		}
		
		//뉴스레터 수정페이지
		@GetMapping("/newsletter/update")
		public ModelAndView updateNewsPage(ModelAndView mv, Principal principal,
											 @RequestParam(name = "no", required = false) int boardNo ) {
			
			CompanyDto dto = service.newsLetterOne(boardNo);
			mv.addObject("news", dto);
				
			return mv;
		}	
		
		//뉴스레터 수정
		@PostMapping("/updateNewsletter")
		public ModelAndView updateNewsletter(ModelAndView mv, int boardNo, BoardDto dto, Principal principal ) {
			dto.setUserId(principal.getName()); 
			service.updateNewsLetter(dto);
			mv.setViewName("redirect:/board/company/newsletter/view?no=" + boardNo);
			return mv;
		}
		
		
		
		//게시물 삭제
		@PostMapping("/delete")
		@ResponseBody
		public int delete(BoardDto dto, Principal principal ) throws Exception{
			dto.setUserId(principal.getName()); 
			int result = -1;
			if(principal.getName().equals(dto.getUserId())) {
				result = service.deletePost(dto);
			}else {
				result = -2;
			}
			return result;
		}
}
