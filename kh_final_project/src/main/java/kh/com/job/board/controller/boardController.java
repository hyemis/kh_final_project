package kh.com.job.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class boardController {
	
	// @Autowired
	
	
		// 게시판 메인 
		@GetMapping("/main")
		public ModelAndView boardmain(ModelAndView mv) {
			return mv;
		}
		
		// 게시판 - 취준방
			@GetMapping("/careerpre")
			public ModelAndView careerpre(ModelAndView mv) {
				return mv;
		}	
			
		// 게시판 - 신입방
			@GetMapping("/careerfirst")
			public ModelAndView careerfirst(ModelAndView mv) {
				return mv;
			}
			
		// 게시판 - 면접방
			@GetMapping("/interview")
			public ModelAndView interview(ModelAndView mv) {
				return mv;
			}

		// 게시판 - 질문게시판
			@GetMapping("/qna")
			public ModelAndView qna(ModelAndView mv) {
				return mv;
			}		
			
		// 게시판 - 뉴스레터
			@GetMapping("/companynews")
			public ModelAndView companynews(ModelAndView mv) {
				return mv;
		}
			
		// 게시판 - 회사소개 
			@GetMapping("/companyinfo")
			public ModelAndView companyinfo(ModelAndView mv) {
				return mv;
		}
		
		// 게시글 
			@GetMapping("/post")
			public ModelAndView post(ModelAndView mv) {
				return mv;
		}
			
		// 게시글 등록 
			@GetMapping("/postinsert")
			public ModelAndView postinsert(ModelAndView mv) {
				return mv;

		}
			
			
}