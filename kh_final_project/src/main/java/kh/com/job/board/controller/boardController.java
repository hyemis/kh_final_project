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
		
		// 게시판 상세 
			@GetMapping("/detail")
			public ModelAndView boarddetail(ModelAndView mv) {
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