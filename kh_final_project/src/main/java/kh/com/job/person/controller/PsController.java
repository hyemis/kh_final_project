package kh.com.job.person.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("/person")
public class PsController {
	
	@Autowired
	private PsService service;
	
	//암호화 기능 가지고 있는 클래스 자동주입
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("person/main");
		return mv;
	}
	
	//
	@PostMapping("/logout")
	public ModelAndView logout(ModelAndView mv) {
		mv.setViewName("person/main");
		return mv;
	}
	
	@GetMapping("/idPw")
	public ModelAndView idpw(ModelAndView mv) {
		
		return mv;
	}
	
	@GetMapping("/findFail")
	public ModelAndView findFail(ModelAndView mv) {
		
		return mv;
	}
	
	// 회원가입 화면 
	@GetMapping("/signUp")
	public ModelAndView viewsignUp(ModelAndView mv) {
		mv.setViewName("person/signUp");
		return mv;
	}
	
	// 회원가입 작성 
	@PostMapping("/signUp")
	public ModelAndView dosignUp(ModelAndView mv, PsUserDto dto, RedirectAttributes rttr ) {
		int result = -1;
		System.out.println("암호화전");
		System.out.println(dto.getUserPw());
		System.out.println(dto);
		
		//입력 받은 비밀번호 가 담겨져 있는 dto 에서 비밀번호 값 꺼내서 인코딩 시킨후 다시 넣어줬어요
		//passwordEncoder.encode() 쓰시면 비밀번호 인코딩 되요
		//한번 확인 하시고 sysout 지우시면 될거같아요
		dto.setUserPw(passwordEncoder.encode(dto.getUserPw()));
		
		System.out.println("암호화후");
		System.out.println(dto.getUserPw());
		
		
		try {
			result = service.insert(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result > 0 ) {
			rttr.addFlashAttribute("msg", "JOB-A 회원가입에 성공하였습니다.");
			mv.setViewName("redirect:/");
		} else {
			rttr.addFlashAttribute("msg", "JOB-A 회원가입에 실패하였습니다.");
			mv.setViewName("redirect:/person/signUp");
		}
		
		
		return mv;
	}
	
//	// 회원가입 아이디 중복 체크 
//	@PostMapping()
//	public int idChk(String userId) {
//		try {
//			int result = service.idChk(userId);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
	
	// 마이페이지 홈-회원정보 확인 화면
	@GetMapping("/mypage")
	public ModelAndView viewMyPage(ModelAndView mv, String userId){
		

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		try {
		if(!userId.equals(auth.getName())) {
			if(!(userId.isEmpty() || userId.equals(""))) {
				
					PsUserDto result = service.selectOne(userId);
					mv.addObject("PsUserDto", result);
				mv.setViewName("person/myPage");
			}else {
				mv.setViewName("redirect:/");
			}
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mv;
	}
	
	
	// 회원정보 업데이트 화면
	@GetMapping("/update")
	public ModelAndView viewUpdate(ModelAndView mv
			, String userId
			, PsUserDto dto
			) {
		
		try {
			dto = service.selectOne(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		mv.addObject("PsUserDto", dto);
		mv.setViewName("/person/update");
		return mv;
	}
	
	
	// 회원정보 업데이트
	@PostMapping("/update")
	public ModelAndView update(ModelAndView mv
			,PsUserDto dto) {

		try {
			service.update(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	

	@GetMapping("/resume")
	public ModelAndView resume(ModelAndView mv) {
		
		return mv;
	}
	
	// 예외처리는 프로젝트 후반에 작성 
	

}
