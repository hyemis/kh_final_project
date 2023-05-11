package kh.com.job.business.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.service.BsAccountService;


@Controller
@RequestMapping("/business/account")
public class BsAccountController {

	// 암호화 기능 가지고 있는 클래스 자동주입
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private BsAccountService service;

	//회원정보 불러오기
	@GetMapping("/info")
	public ModelAndView viewinfo(ModelAndView mv, BsUserDto dto, Principal principal) {
		//로그인한 아이디
		System.out.println(principal.getName());
		
		mv.addObject("bsinfo",service.viewAccount(principal.getName()));
		return mv;
	}
	
	//회원정보 수정
	@PostMapping("/info")
	public ModelAndView update(ModelAndView mv, BsUserDto dto
						, Principal principal, RedirectAttributes rttr
						,@RequestParam(name = "userImage", required = false) MultipartFile userImage)  {
		dto.setUserId(principal.getName()); 
		
		//이력서 사진 업로드
		if(userImage != null && !userImage.isEmpty()) {
			String reportUrl = service.uploadUserPic(userImage, principal.getName());
		    dto.setUserPic(reportUrl);
		}
		
		service.updateAccount(dto);
		mv.setViewName("redirect:/business/account/info");
		rttr.addFlashAttribute("msg", "회원정보 수정에 성공했습니다.");
		return mv;
	}
	
	
	//회원비밀번호 확인
	@PostMapping("/pwChk") 
	public ModelAndView pwChk(String confirmPw, ModelAndView mv, RedirectAttributes rttr) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		BsUserDto dto = service.viewAccount(auth.getName());
				
		if(passwordEncoder.matches(confirmPw, dto.getUserPw())) {
			rttr.addFlashAttribute("chkpw", "비밀번호 일치");
			mv.setViewName("redirect:/business/account/info");
		}else {
			rttr.addFlashAttribute("chkpw", "비밀번호 불일치");
			mv.setViewName("redirect:/business/account/info");
		}
			
		return mv;
		}
	

	// 비밀번호 업데이트
		@PostMapping("/updatePw")
		public ModelAndView updatePw(ModelAndView mv, BsUserDto dto, Principal principal, RedirectAttributes rttr) throws Exception {

			if(principal.getName()!= null) {
				dto.setUserId(principal.getName());
				dto.setUserPw(passwordEncoder.encode(dto.getUserPw())); // 패스워드 암호화
				service.updatePassword(dto);
				mv.setViewName("redirect:/business/account/info");
				rttr.addFlashAttribute("msg", "비밀번호변경에 성공했습니다.");
			}else {
				mv.setViewName("redirect:/business/account/info");
				rttr.addFlashAttribute("msg", "비밀번호변경에  실패했습니다.");
			}

			return mv;
		}
	
    
	

	
	
	
	
	
}
