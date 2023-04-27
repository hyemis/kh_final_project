package kh.com.job.board.controller;


import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.service.BoardService;
import kh.com.job.business.model.service.BsRecruitService;

@Controller
@RequestMapping("/board")
public class boardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private BsRecruitService brservice;
	
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
			@GetMapping("/newsletter")
			public ModelAndView companynews(ModelAndView mv) {
				return mv;
		}
			
		// 게시판 - 회사소개 
			@PostMapping("/companyinfo")
			public ModelAndView companyinfo(ModelAndView mv) {
				return mv;		        
			        
		}
		
		// 게시글 작성
		@GetMapping("/writepost")
		public ModelAndView viewwritePost(ModelAndView mv) throws Exception {
				
			//카테고리 코드 타입 ('UBD')가져오기
			mv.addObject("UBDlist", brservice.getCateList("UBD"));
			// 게시글 목록
			List<BoardDto> boardList = service.boardList();
			mv.addObject("boardList", boardList);
			return mv;
		}
		
		// 게시글 작성
		@PostMapping("/writepost")
		public ModelAndView dowritePost(ModelAndView mv, BoardDto dto, Principal principal) throws Exception {
				
			int result = -1;
			
			if(principal != null) {
				dto.setUserId(principal.getName());
			}
			
			result = service.insertBoard(dto);
			
			if(result == 1) {
				mv.setViewName("redirect:/board/main");
			}
			
			//이거 오류 페이지 넘기는거 해야됨
			mv.setViewName("redirect:/board/main");
			return mv;
			
		}
		
			
		// 게시글 이미지 업로드
		@PostMapping("/imageUpload")
		@ResponseBody
		public String imageUpload(@RequestParam("upload") MultipartFile file , Principal principal){
				Map<String, Object> map = new HashMap<>();
				 
				String url = brservice.uploadDocument(file, principal.getName());		

				map.put("uploaded", 1);
				map.put("url", url);

				return new Gson().toJson(map);
		}
		
		// 게시글 전체 조회 페이지
		@GetMapping("/postall")
		public ModelAndView viewPostAll(ModelAndView mv) throws Exception {
			// 게시글 목록
			List<BoardDto> boardList = service.boardList();
			// updateDate를 시분까지 잘라서 저장 및 boardContent 제거
			for (BoardDto board : boardList) {
			    String updateDate = board.getUpdateDate();
			    board.setUpdateDate(updateDate.substring(11, 16)); // 11번째 문자부터 16번째 문자 전까지 잘라서 저장

			    // boardContent에서 img 태그 제거 및 문자열 20자 이하로 자르기
			    String boardContent = board.getBoardContent().replaceAll("<img[^>]*>","").replaceAll("\\<.*?>","");
			    board.setBoardContent(boardContent);
			}
			mv.addObject("boardList", boardList);
			return mv;
		}	
		
		// 게시글 상세 조회 
		@GetMapping("/detail/{boardNo}")
		public ModelAndView viewRecruit(ModelAndView mv, @PathVariable String boardNo, Principal principal) throws Exception {
			
			Map<String, Object> infoMap = new HashMap<>();
			infoMap.put("userId", principal.getName());
			infoMap.put("boardNo", boardNo);
			
			BoardDto detail = service.detailBoard(infoMap);
			
			// updateDate 문자열에서 시분초까지 자르기
		    String updateDate = detail.getUpdateDate().substring(0, 19);

		    // BoardDto 객체에 자른 updateDate 문자열을 다시 저장
		    detail.setUpdateDate(updateDate);
			
			
			mv.addObject("detailBoard", detail);
			
			mv.setViewName("board/detail");
			return mv;
		}
			
	
			
			


 
		//이거 매핑 주소 post 말고 다른걸로 해주실 수 있나요???
		// 게시글 
			@GetMapping("/post")
			public ModelAndView post(ModelAndView mv) {
				return mv;
		}
			
		// 이거 매핑 주소 post 말고 다른걸로 해주실 수 있나요???	
		// 게시글 등록 
			@GetMapping("/postinsert")
			public ModelAndView postinsert(ModelAndView mv) {
				return mv;

		}
			
			
}