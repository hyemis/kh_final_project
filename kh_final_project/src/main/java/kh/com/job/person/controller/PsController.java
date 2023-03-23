package kh.com.job.person.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.common.file.FileUtil;
import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("/person")
public class PsController {
	
	@Autowired
	private PsService service;
	
	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;
	
	private final static String UPLOAD_FOLDER = "\\resources\\uploadfiles";
	
	//암호화 기능 가지고 있는 클래스 자동주입
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	


	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		
		try {
			mv.addObject("plist", service.selectList());
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
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
	public ModelAndView dosignUp(ModelAndView mv
			, PsUserDto dto
			, RedirectAttributes rttr
			,@RequestParam(name="report", required = false) MultipartFile multi
			, HttpServletRequest request
			, String userBirth) {

		  int result = -1;
		  System.out.println("string 으로 받은 값 " + userBirth);
		  
		  Map<String, String> filePath;

		  try {
		         filePath = fileUtil.saveFile(multi, request, null);
		         dto.setUserPic(filePath.get("rename"));
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		  // 패스워드 암호화 
		dto.setUserPw(passwordEncoder.encode(dto.getUserPw()));
		
		try {
				
			// text 로 받은 날짜 timestamp 로 변환해서 dto 에 저장 
			 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 Date date = dateFormat.parse(userBirth);
			 Timestamp timestamp = new Timestamp(date.getTime());
			 
			 System.out.println("변환 했지 >" + timestamp);
			 dto.setUserBirth(timestamp);
			 
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

	// 아이디 중복 체크 
	@PostMapping("/idChk") 
	@ResponseBody
	public String idChk(@RequestParam(value="userId", required=false) String id) {
		String result = "N";
		
		try {
			int idChk = service.idChk(id);
			if(idChk == 1) {
				result = "Y";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	// 마이페이지 홈-회원정보 확인 화면
	@GetMapping("/mypage")
	public ModelAndView viewMyPage(ModelAndView mv, Principal principal) throws Exception{
		System.out.println("로그인정보: "+principal.getName());
		
		if(principal.getName() != null) {
			mv.addObject("PsUserDto", service.selectOne(principal.getName()));
		}else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	
	// 회원정보 업데이트 화면
	@GetMapping("/update")
	public ModelAndView viewUpdate(ModelAndView mv, Principal principal) throws Exception {
		System.out.println("로그인정보: "+principal.getName());
		
		if(principal.getName() != null) {
			mv.addObject("PsUserDto", service.selectOne(principal.getName()));
		}else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	
	// 회원정보 업데이트
	@PostMapping("/update")
	public ModelAndView update(ModelAndView mv,PsUserDto dto) {

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
	@ExceptionHandler
	public void exception(Exception e) {
		e.printStackTrace();
//		ModelAndView mv = new ModelAndView();
//		return mv;
	}

}
