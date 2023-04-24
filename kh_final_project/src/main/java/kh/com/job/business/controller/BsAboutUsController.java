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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.service.BsAboutUsService;

@Controller
@RequestMapping("/business/aboutus")
public class BsAboutUsController {

	@Autowired
	private BsAboutUsService service;
	
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
		
	
	// 회사소개 보기
	@GetMapping("/companyinfo")
	public ModelAndView companyinfo(ModelAndView mv, BoardDto dto, Principal principal) {
	    System.out.println(principal.getName());
	    
	    mv.addObject("info",service.viewCompanyInfo(principal.getName()));
	    
	    //tag값 분리
	    String tag = dto.getTag();		
	    if (tag != null && !tag.isEmpty()) { // tag 값이 null 또는 빈 문자열이 아닌 경우에만 처리
	        String[] tags = tag.split(",");
	        mv.addObject("tags", tags);
	    }
	    
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
	
	//뉴스레터 수정
	@PostMapping("/newsletterupdate")
	public ModelAndView update(ModelAndView mv, BoardDto dto , Principal principal, RedirectAttributes rttr) {
						
		dto.setUserId(principal.getName()); 
		
		service.updateNewsLetter(dto);
		mv.setViewName("redirect:/business/aboutus/newsletter");
		rttr.addFlashAttribute("msg", "뉴스레터 수정 완료");
		
		List<BoardDto> list = service.newsLetterList(principal.getName());
		
		mv.addObject("news", list);
		return mv;
	}
	
	// 뉴스레터 페이지 불러오기
	@GetMapping("/newsletter")
	public ModelAndView newsletter(ModelAndView mv, BoardDto dto, Principal principal) {
		List<BoardDto> list = service.newsLetterList(principal.getName());
		
		mv.addObject("news", list);
		
		return mv;
	}
	
	// 뉴스레터 상세보기
	@GetMapping("/newsletter/view")
	public ModelAndView viewReadBoard(
			ModelAndView mv
			, @RequestParam(name = "no", required = false) int boardNo
			, Principal principal
			) {
		
		String userId = principal.getName(); ;
		
		BoardDto dto = service.newsLetterOne(boardNo,userId);
		mv.addObject("news", dto);
		
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
