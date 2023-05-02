package kh.com.job.business.controller;


import java.security.Principal;
import java.util.Arrays;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.dto.CompanyDto;
import kh.com.job.board.model.service.BoardService;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.service.BsAboutUsService;
import kh.com.job.common.page.Paging;

@Controller
@RequestMapping("/business/aboutus")
public class BsAboutUsController {

	@Autowired
	private BsAboutUsService service;

	@Autowired
	private BoardService bdservice;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;


	// 회사소개작성
		@PostMapping("/infoform")
		public ModelAndView insertCompanyInfo(ModelAndView mv, BoardDto dto, Principal principal, RedirectAttributes rttr)  {
			dto.setUserId(principal.getName()); 
			service.insertCompanyInfo(dto);
			mv.setViewName("redirect:/business/aboutus");
			rttr.addFlashAttribute("msg", "성공적으로 등록되었습니다.");
			System.out.println(dto);
			return mv;
		}
		

	// 뉴스레터 작성
	@PostMapping("/newsletterform")
	public ModelAndView insertNewsletter(ModelAndView mv, BoardDto dto, Principal principal, RedirectAttributes rttr)  {
		dto.setUserId(principal.getName()); 
		service.insertNewsletter(dto);
		mv.setViewName("redirect:/business/aboutus/newsletter");
		rttr.addFlashAttribute("msg", "뉴스레터가 성공적으로 등록되었습니다.");
		System.out.println(dto);
		return mv;
	}
	
	
	// 뉴스레터 리스트
	@GetMapping("/newsletter")
	public ModelAndView newsletter(ModelAndView mv, BoardDto dto, Principal principal) {
		//조회될 회원아이디
		dto.setUserId(principal.getName()); 
		//페이징시, 페이지값(pnum) 0일 때, 기본값 1로 설정
		if(dto.getPnum() < 1) {
		dto.setPnum(1);
		}
		Paging list = service.newsLetterList(dto);
		System.out.println(dto);
						
		mv.addObject("news", list);		
		
		return mv;
	}
	
		
	
	// Q&A 페이지 불러오기
	@GetMapping("/qna")
	public ModelAndView qna(ModelAndView mv) {
		return mv;
	}
	
	
	//이미지 업로드
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


//	
}
