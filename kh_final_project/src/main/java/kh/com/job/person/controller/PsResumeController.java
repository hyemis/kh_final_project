package kh.com.job.person.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.person.model.service.PsResumeService;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("person/resume")
public class PsResumeController {
	
	@Autowired
	private PsResumeService rservice;
	@Autowired
	private PsService pservice;
	
	
	//이력서관리 페이지 열기
	@GetMapping("/list")
	public ModelAndView doList(ModelAndView mv, @RequestParam(name = "userId") String userId) {
		try {
			
			PsUserDto result = pservice.selectOne(userId);
			List<PsResumeDto> resume = rservice.selectList(userId);
			
			if(result!=null) {
				mv.addObject("userinfo", result);
				mv.addObject("resumelist", resume);
				mv.setViewName("person/resume/list");
			} else {
				mv.setViewName("redirect:/");
			}
		} 
			catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	
	// 이력서 작성 페이지 열기 
	@GetMapping("/write")
	public ModelAndView doResume(ModelAndView mv
			, @RequestParam(name = "userId") String userId){
		
			System.out.println(userId);
		try {
			
			PsUserDto result = pservice.selectOne(userId);
			
			if(result!=null) {
				mv.addObject("userinfo", result);
				mv.setViewName("person/resume/write");
			} else {
				mv.setViewName("redirect:/");
			}
		} 
			catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 이력서 파일 업로드 
		@PostMapping("/fileupload")
		@ResponseBody
		  public ModelAndView fileupload(ModelAndView mv, @RequestParam(name = "report", required = false) MultipartFile file,Principal principal) throws Exception {
			
			if(!file.isEmpty()) {
				PsUserDto result = pservice.selectOne(principal.getName());
				if(result!=null) {
					mv.addObject("url", rservice.upload(file));
					mv.addObject("userinfo", result);
				}
			}  
			mv.setViewName("person/resume/write");
			  return mv;
		  }

		
		// 이력서 작성
		@PostMapping("/write")
		@ResponseBody
		public int writeResume( Principal principal
				, PsResumeDto dto
				, @RequestParam(name = "uploadPortf", required = false) MultipartFile uploadPortf) {
			
			System.out.println("로그인정보: "+principal.getName());
			System.out.println("파일 url "+ dto.getResumePhoto());
			
			dto.setUserId(principal.getName());
			
			if(!uploadPortf.isEmpty()) {
				String portfUrl = rservice.upload(uploadPortf);
			    dto.setPortfFile(portfUrl);
			}
			
			int result = -1;
			try {
				result = rservice.insert(dto);
				return result;
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			return result;
		}
	
	// 이력서 삭제 
	@PostMapping("/delete")
	public ModelAndView deleteResume(ModelAndView mv, int resumeNo, Principal principal, RedirectAttributes rttr) throws Exception {
		
		System.out.println(resumeNo);
		
		String url = "/person/resume/list?userId=" + principal.getName();
		int result = rservice.delete(resumeNo);
		
		if(result > 0 ) {
			rttr.addFlashAttribute("msg", "이력서가 삭제되었습니다.");
			
		} else {
			rttr.addFlashAttribute("msg", "이력서 삭제에 실패했습니다.");
		}
		mv.setViewName("redirect:"+ url);
		return mv;
	}
	
//	// 이력서 상세보기 화면 
//	@GetMapping("/read/{resumeNo}")
//	public ModelAndView viewReadResume(ModelAndView mv, Principal principal, @PathVariable int resumeNo ) throws Exception {
//		String userId = principal.getName();
//		
//		PsUserDto result = pservice.selectOne(principal.getName());
//		mv.addObject("userinfo", result);
//		
//		PsResumeDto dto = rservice.rselectOne(new Object[] { principal.getName(), resumeNo });
//		mv.addObject("resume", dto);
//		return mv;
//	}
	
	// 이력서 상세보기 화면 
	@GetMapping("/read/{resumeNo}")
	public ModelAndView viewReadResume(ModelAndView mv, Principal principal, @PathVariable int resumeNo ) throws Exception {
		String userId = principal.getName();
	
		Map<String, Object> infoMap = new HashMap<>();
		infoMap.put("userId", userId);
		infoMap.put("resumeNo", resumeNo);
		
		PsUserDto result = pservice.selectOne(userId);
		mv.addObject("userinfo", result);
		
		PsResumeDto dto = rservice.rselectOne(infoMap);
		mv.addObject("resume", dto);
		
		return mv;
	}
		
	// 예외처리는 프로젝트 후반에 작성 
	

}
