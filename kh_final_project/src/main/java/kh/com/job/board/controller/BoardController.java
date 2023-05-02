package kh.com.job.board.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.board.model.dto.CompanyDto;
import kh.com.job.board.model.dto.ReplyDto;
import kh.com.job.board.model.service.BoardService;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.service.BsAboutUsService;
import kh.com.job.business.model.service.BsRecruitService;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingBoardDto;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private BsRecruitService brservice;
	
	@Autowired
	private BsAboutUsService baservice;
	
	// 회사정보
		@GetMapping("/company")
		public ModelAndView company(ModelAndView mv) {
			return mv;
		}
		
	// 커뮤니티 (게시판메인)
	@GetMapping("/main")
	public ModelAndView boardmain(ModelAndView mv) throws Exception {
		mv.addObject("UBDlist", service.getBoardCate());
		mv.addObject("topReadPost", service.topReadPost());
		
		mv.addObject("UBD01", service.postListByCate("UBD01").stream().limit(5).collect(Collectors.toList()));
		mv.addObject("UBD02", service.postListByCate("UBD02").stream().limit(5).collect(Collectors.toList()));
		mv.addObject("UBD03", service.postListByCate("UBD03").stream().limit(5).collect(Collectors.toList()));
		mv.addObject("UBD04", service.postListByCate("UBD04").stream().limit(5).collect(Collectors.toList()));
		return mv;
	}

	// 게시판 - 질문게시판
	@GetMapping("/qna")
	public ModelAndView qna(ModelAndView mv) {
		return mv;
	}

	


	// 게시글 작성
	@GetMapping("/writepost")
	public ModelAndView viewwritePost(ModelAndView mv) throws Exception {

		// 카테고리 코드 타입 ('UBD')가져오기
		mv.addObject("UBDlist", service.getBoardCate());
//		// 게시글 목록
//		List<BoardDto> boardList = service.postList();
//		mv.addObject("boardList", boardList);
		return mv;
	}

	// 게시글 작성
	@PostMapping("/writepost")
	public ModelAndView dowritePost(ModelAndView mv, BoardDto dto, Principal principal) throws Exception {

		int result = -1;

		if (principal != null) {
			dto.setUserId(principal.getName());
		}

		result = service.insertPost(dto);

		if (result == 1) {
			mv.setViewName("redirect:/board/main");
		}

		// 이거 오류 페이지 넘기는거 해야됨
		mv.setViewName("redirect:/board/main");
		return mv;

	}

	// 게시글 이미지 업로드
	@PostMapping("/imageUpload")
	@ResponseBody
	public String imageUpload(@RequestParam("upload") MultipartFile file, Principal principal) {
		Map<String, Object> map = new HashMap<>();

		String url = brservice.uploadDocument(file, principal.getName());

		map.put("uploaded", 1);
		map.put("url", url);

		return new Gson().toJson(map);
	}

	// 게시판별 게시글 출력 
//	@GetMapping("/postall")
//	public ModelAndView postall(ModelAndView mv, @RequestParam(required = false, name = "cate") String cate, PagingBoardDto bdto)
//	        throws Exception {
//
//	    if (cate == null) {
//	        // 카테고리 파라미터가 없는 경우, 전체 게시글을 가져옴
//	        mv.addObject("searchResult", "게시글 전체 검색결과");
//	        mv.addObject("totalCount", service.getCountByPs(bdto));
//
//	        if (bdto.getPnum() <= 0) {
//	            bdto.setPnum(1);
//	        }
//	        
//	        Paging list = service.pageList(bdto);
//	        preprocessBoardList(list.getPage());
//	        mv.addObject("boardList", list);
//
//	    } else {
//	        // 카테고리 파라미터가 있는 경우, 해당 카테고리에 해당하는 게시글만 가져옴
//	        
//	        String categoryName = service.getCateName(cate);
//	        mv.addObject("searchResult", categoryName + "  검색결과");
//	        mv.addObject("totalCount", service.countByCate(cate));
//	        
//	        if (bdto.getPnum() <= 0) {
//	            bdto.setPnum(1);
//	        }
//	        
//	        bdto.setCategoryId(cate);
//	        Paging list = service.pageList(bdto);
//	        preprocessBoardList(list.getPage());
//	        mv.addObject("boardList", list);
//	    }
//	    return mv;
//	    }
	
	@GetMapping("/postall")
	public ModelAndView postall(ModelAndView mv
			, @RequestParam(required = false, name = "cate") String cate
			, PagingBoardDto bdto)
	        throws Exception {
	

	    if (cate == null || cate.isEmpty()) {
	        // 카테고리 파라미터가 없는 경우, 전체 게시글을 가져옴
	        mv.addObject("searchResult", "게시글 전체 검색결과");
	        mv.addObject("totalCount", service.getCountByPs(bdto));
	        bdto.setCategoryId(null); // categoryId를 null로 설정해야 전체 게시글 페이지에서 categoryId가 없는 URL이 생성됩니다.

	        if (bdto.getPnum() < 1) {
	            bdto.setPnum(1);
	        }

	        Paging list = service.pageList(bdto);
	        preprocessBoardList(list.getPage(), bdto.getCategoryId());
	        mv.addObject("boardList", list);

	    } else {
	        // 카테고리 파라미터가 있는 경우, 해당 카테고리에 해당하는 게시글만 가져옴

	        String categoryName = service.getCateName(cate);
	        mv.addObject("searchResult", categoryName + "  검색결과");
	        mv.addObject("totalCount", service.countByCate(cate));

	        if (bdto.getPnum() < 1) {
	            bdto.setPnum(1);
	        }

	        bdto.setCategoryId(cate);
	        Paging list = service.pageList(bdto);
	        preprocessBoardList(list.getPage(), bdto.getCategoryId());
	        mv.addObject("boardList", list);
	    }

	    mv.addObject("categoryId", bdto.getCategoryId()); // categoryId를 JSP로 전달
	    System.out.println("ctrl categoryId : " + bdto.getCategoryId());
	    return mv;
	}

	// 게시글 상세 조회 + 조회 수 증가
	@GetMapping("/detail/{boardNo}")
	public ModelAndView viewRecruit(ModelAndView mv, @PathVariable Integer boardNo, Principal principal)
			throws Exception {

		// principal이 null인 경우 username은 null로 설정
		String readUser = principal != null ? principal.getName() : null;
		BoardDto detail = service.detailBoard(readUser, boardNo);

		// updateDate 문자열에서 시분초까지 자르기
		String updateDate = detail.getUpdateDate().substring(0, 19);
		detail.setUpdateDate(updateDate);

		// 댓글 목록
		List<ReplyDto> reply = service.replyList(boardNo);

		mv.addObject("detailBoard", detail);
		mv.addObject("replyList", reply);
		mv.setViewName("board/detail");
		return mv;
	}

	// 게시글 좋아요
	@PostMapping("/updatelike")
	@ResponseBody
	public Map<String, Object> updateLike(int boardNo, Principal principal) throws Exception {

		int result = service.updateLike(principal.getName(), boardNo);
		Map<String, Object> response = new HashMap<>();
		if (result > 0) {
			response.put("result", "success");
		} else {
			response.put("result", "fail");
		}
		return response;
	}

	// 게시글 삭제
	// TODO: 쿼리문 제약 조건 설정이 안되어서 추후에 다시 시도 예정
	@PostMapping("/deletepost")
	@ResponseBody
	public Map<String, Object> deletePost(int boardNo, Principal principal) throws Exception {

		int result = -1;
		Map<String, Object> response = new HashMap<>();
		if (result > 0) {
			response.put("result", "success");
		} else {
			response.put("result", "fail");
		}
		return response;
	}

	// 게시글 수정
	@PostMapping("/updatepost")
	@ResponseBody
	public Map<String, Object> updatePost(int boardNo, BoardDto dto, Principal principal) throws Exception {

		dto.setUserId(principal.getName());
		int result = service.updatePost(dto);
		Map<String, Object> response = new HashMap<>();
		if (result > 0) {
			response.put("result", "success");
		} else {
			response.put("result", "fail");
		}
		return response;
	}

	// 댓글 등록
	@PostMapping("/writereply")
	@ResponseBody
	public Map<String, Object> writeReply(ModelAndView mv, ReplyDto dto, Principal principal) throws Exception {

		dto.setUserId(principal.getName());
		int result = service.insertReply(dto);

		Map<String, Object> response = new HashMap<>();
		if (result > 0) {
			response.put("result", "success");
		} else {
			response.put("result", "fail");
		}
		return response;
	}

	// 댓글 삭제
	@PostMapping("/deletereply")
	@ResponseBody
	public Map<String, Object> deleteReply(ModelAndView mv, ReplyDto dto, Principal principal) throws Exception {

		dto.setUserId(principal.getName());
		int result = service.deleteReply(dto);

		Map<String, Object> response = new HashMap<>();
		if (result > 0) {
			response.put("result", "success");
		} else {
			response.put("result", "fail");
		}
		return response;
	}

	//

	// 댓글 수정
	@PostMapping("/updatereply")
	@ResponseBody
	public Map<String, Object> updateReply(ModelAndView mv, ReplyDto dto, Principal principal) throws Exception {

		dto.setUserId(principal.getName());
		int result = service.updateReply(dto);

		Map<String, Object> response = new HashMap<>();
		if (result > 0) {
			response.put("result", "success");
		} else {
			response.put("result", "fail");
		}
		return response;
	}
	
//	//커뮤니티 게시글 출력 
//	private void preprocessBoardList(Object obj) {
//		List<BoardDto> boardList = (List<BoardDto>) obj;
//		
//	    // updateDate를 시분까지 잘라서 저장
//	    for (BoardDto board : boardList) {
//	        String updateDate = board.getUpdateDate();
//	        board.setUpdateDate(updateDate.substring(0, 16));
//	    }
//
//	    // boardContent에서 img 태그 제거 및 문자열 20자 이하로 자르기
//	    boardList.forEach(board -> {
//	        String boardContent = board.getBoardContent().replaceAll("<img[^>]*>", "").replaceAll("\\<.*?>", "");
//	        board.setBoardContent(boardContent.length() > 20 ? boardContent.substring(0, 20) : boardContent);
//	    });
//	    
//	}
	
	private void preprocessBoardList(Object obj, String categoryId) {
	    List<BoardDto> boardList = (List<BoardDto>) obj;
	    
	    // updateDate를 시분까지 잘라서 저장
	    for (BoardDto board : boardList) {
	        String updateDate = board.getUpdateDate();
	        board.setUpdateDate(updateDate.substring(0, 16));
	    }

	    // boardContent에서 img 태그 제거 및 문자열 20자 이하로 자르기
	    boardList.forEach(board -> {
	        String boardContent = board.getBoardContent().replaceAll("<img[^>]*>", "").replaceAll("\\<.*?>", "");
	        board.setBoardContent(boardContent.length() > 20 ? boardContent.substring(0, 20) : boardContent);
	    });

	    // categoryId 값이 null이 아닌 경우, 해당 카테고리에 속하지 않는 게시글은 리스트에서 제외
	    if (categoryId != null) {
	        boardList.removeIf(board -> !board.getCategoryId().equals(categoryId));
	    }
	}

}