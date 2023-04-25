package kh.com.job.person.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.admin.model.service.AdBusinessService;
import kh.com.job.admin.model.service.AdCategotyService;
import kh.com.job.business.model.dto.BsRecruitDetailDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.service.BsRecruitService;
import kh.com.job.common.file.FileUtil;
import kh.com.job.common.mail.MailUtil;
import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.dto.PsScrapInfoDto;
import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.person.model.service.PsResumeService;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("/person")
public class PsMainController {

	@Autowired
	private PsService service;

	@Autowired
	private AdCategotyService cateservice;

	@Autowired
	private PsResumeService rservice;
	
	@Autowired
	private BsRecruitService brservice;

	@Autowired
	private AdBusinessService abs;

	@Autowired
	@Qualifier("fileUtil")
	private FileUtil fileUtil;

	private final static String UPLOAD_FOLDER = "\\resources\\uploadfiles";

	// 암호화 기능 가지고 있는 클래스 자동주입
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 메인화면
	@GetMapping("/main")
	public ModelAndView viewmain(ModelAndView mv) {
		return mv;
	}

	// 아이디 찾기
	@GetMapping("/findid")
	public ModelAndView viewfindId(ModelAndView mv) {
		mv.setViewName("person/findid");
		return mv;
	}

	// 아이디 찾기
	@PostMapping("/findid")
	@ResponseBody
	public String dofindId(ModelAndView mv, @RequestParam("name") String nameParam,
			@RequestParam("birth") String birthParam, @RequestParam("email") String email,
			@RequestParam("phone") String phone) throws Exception {

		Object birth = birthParam.replaceAll("[^0-9]", "");
		Object name = nameParam.replace(",", "");

		Map<String, Object> findId = new HashMap<>();
		findId.put("userName", name);
		findId.put("userBirth", birth);
		findId.put("userEmail", email);
		findId.put("userPhone", phone);

		System.out.println("map 저장 값 " + findId);

		PsUserDto userId = service.findId(findId);
		String findUserId = userId.getUserId();
		return findUserId;
	}

	// 비밀번호 찾기
	@GetMapping("/findpw")
	public ModelAndView viewfindPw(ModelAndView mv) {
		mv.setViewName("person/findpw");
		return mv;
	}

//	// 비밀번호 찾기 	
//	@PostMapping("/findpw")
//	@ResponseBody
//	public int dofindPw(ModelAndView mv,  HttpServletRequest request) throws Exception {
//		
//		Map<String,Object> findPw = new HashMap<>();
//		
//		if (request.getParameter("id") != null) {
//		    findPw.put("userId", request.getParameter("id"));
//		} else if (request.getParameter("p-id") != null) {
//		    findPw.put("userId", request.getParameter("p-id"));
//		}
//		
//		if (request.getParameter("name") != null) {
//		    findPw.put("userId", request.getParameter("name"));
//		} else if (request.getParameter("p-name") != null) {
//		    findPw.put("userName", request.getParameter("p-name"));
//		}
//		findPw.put("userName", request.getParameter("name"));
//		findPw.put("userBirth", request.getParameter("birth"));
//		findPw.put("userEmail", request.getParameter("email"));
//		findPw.put("userPhone", request.getParameter("phone"));
//		
//		System.out.println("map 저장 값" + findPw);
//		
//		PsUserDto dto = service.findPw(findPw);
//		
//		// TODO: 임시 비밀번호 만들기
//		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
//		Random random = new Random();
//	    int length = random.nextInt(9) + 8; // 8~16 사이의 길이
//	    StringBuilder sb = new StringBuilder();
//	    for (int i = 0; i < length; i++) {
//            int index = random.nextInt(chars.length());
//            sb.append(chars.charAt(index));
//        }
//	    String newpassword = sb.toString();
//	    dto.setUserPw(newpassword);
//	    
//	    
//	    // TODO:비밀번호 update 
//	    int update = service.update(dto);
//	    System.out.println(dto);
//	    dto.getUserEmail();
//	    
//	    
//	    // TODO: 찾은 이메일로 메일 발송 
//	    String title = "job-a 임시 비밀번호입니다.";
//		String from = "tkdtlrdl07@gmail.com";
//		String text = "<h1>job-a 임시 비밀번호입니다.</h1><br>회원님의 임시 비밀번호는 " + newpassword + " 입니다. <br>해당 비밀번호로 로그인 후 회원정보 수정 페이지에서 새로운 비밀번호로 변경하세요.";
//		String to = dto.getUserEmail(); 
//		String[]  cc = new String[0];
//		int ccNum = cc.length;
//		MailUtil.mailSend(title, from, text, to, cc, ccNum);
//		
//		return update;
//	}

	// 비밀번호 찾기
	@PostMapping("/findpw")
	@ResponseBody
	public int dofindPw(ModelAndView mv, @RequestParam("id") String id, @RequestParam("pid") String pid,
			@RequestParam("name") String name, @RequestParam("pname") String pname, @RequestParam("birth") String birth,
			@RequestParam("pbirth") String pbirth, @RequestParam("email") String email,
			@RequestParam("phone") String phone) throws Exception {

		Map<String, Object> findPw = new HashMap<>();
		if (!id.isEmpty()) {
			findPw.put("userId", id);
		} else if (!pid.isEmpty()) {
			findPw.put("userId", pid);
		}

		if (!name.isEmpty()) {
			findPw.put("userName", name);
		} else if (!pname.isEmpty()) {
			findPw.put("userName", pname);
		}

		if (!birth.isEmpty()) {
			findPw.put("userBirth", birth);
		} else if (!pbirth.isEmpty()) {
			findPw.put("userBirth", pbirth);
		}

		findPw.put("userEmail", email);
		findPw.put("userPhone", phone);

		System.out.println("map 저장 값" + findPw);

		PsUserDto dto = service.findPw(findPw);

		// TODO: 임시 비밀번호 만들기
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		Random random = new Random();
		int length = random.nextInt(9) + 8; // 8~16 사이의 길이
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < length; i++) {
			int index = random.nextInt(chars.length());
			sb.append(chars.charAt(index));
		}
		String newpassword = sb.toString();
		dto.setUserPw(passwordEncoder.encode(newpassword)); // 패스워드암호화

		// TODO:비밀번호 update
		int update = service.update(dto);
		System.out.println(dto);
		dto.getUserEmail();

		// TODO: 찾은 이메일로 메일 발송
		String title = "job-a 임시 비밀번호입니다.";
		String from = "tkdtlrdl07@gmail.com";
		String text = "<h1>job-a 임시 비밀번호입니다.</h1><br>회원님의 임시 비밀번호는 " + newpassword
				+ " 입니다. <br>해당 비밀번호로 로그인 후 회원정보 수정 페이지에서 새로운 비밀번호로 변경하세요.";
		String to = dto.getUserEmail();
		String[] cc = new String[0];
		int ccNum = cc.length;
		MailUtil.mailSend(title, from, text, to, cc, ccNum);

		return update;
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
	public ModelAndView dosignUp(ModelAndView mv, PsUserDto dto, RedirectAttributes rttr, HttpServletRequest request) {

		int result = -1;

		try {

			dto.setUserPw(passwordEncoder.encode(dto.getUserPw()));
			result = service.insert(dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			rttr.addFlashAttribute("msg", "JOB-A 회원가입에 성공하였습니다.");
			mv.setViewName("redirect:/");
			return mv;
		} else {
			rttr.addFlashAttribute("msg", "JOB-A 회원가입에 실패하였습니다.");
			mv.setViewName("redirect:/person/signUp");
			return mv;
		}

	}

	// 기업 회원가입
	@PostMapping("/bsSignUp")
	public ModelAndView doBsSignUp(ModelAndView mv, PsUserDto dto, RedirectAttributes rttr,
			HttpServletRequest request) {

		int result = -1;

		try {

			dto.setUserPw(passwordEncoder.encode(dto.getUserPw()));
			result = service.businessInsert(dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			rttr.addFlashAttribute("msg", "JOB-A 기업 회원가입에 성공하였습니다.");
			mv.setViewName("redirect:/");
			return mv;
		} else {
			rttr.addFlashAttribute("msg", "JOB-A 기업  회원가입에 실패하였습니다.");
			mv.setViewName("redirect:/person/signUp");
			return mv;
		}

	}

	// 아이디 중복 체크
	@PostMapping("/idChk")
	@ResponseBody
	public String idChk(String userId) throws Exception {
		System.out.println("회원아이디: " + userId);
		int result = service.idChk(userId);
		String data = "N";
		if (result == 1) {
			data = "Y";
			return data;
		} else {
			return data;
		}
	}

	// 마이페이지 홈-회원정보 확인 화면
	@GetMapping("/mypage")
	public ModelAndView viewMyPage(ModelAndView mv, Principal principal) throws Exception {
		System.out.println("로그인정보: " + principal.getName());

		if (principal.getName() != null) {
			mv.addObject("PsUserDto", service.selectOne(principal.getName()));
			mv.setViewName("person/mypage");
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}

	// 마이페이지에서 회원 비밀번호 확인
	@PostMapping("/pwChk")
	public ModelAndView pwChk(String confirmPw, ModelAndView mv, RedirectAttributes rttr) throws Exception {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		PsUserDto pdto = service.selectOne(auth.getName());

		if (passwordEncoder.matches(confirmPw, pdto.getUserPw())) {
			mv.setViewName("redirect:/person/update");
		} else {
			rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다. 다시 확인해주세요.");
			mv.setViewName("redirect:/person/mypage");
		}

		return mv;
	}

	// 회원정보 업데이트 화면
	@GetMapping("/update")
	public ModelAndView viewUpdate(ModelAndView mv, Principal principal) throws Exception {
		System.out.println("로그인정보: " + principal.getName());

		if (principal.getName() != null) {
			mv.addObject("PsUserDto", service.selectOne(principal.getName()));
			mv.setViewName("person/update");
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}

	// 회원정보 업데이트
	@PostMapping("/update")
	public ModelAndView update(ModelAndView mv, PsUserDto dto, Principal principal, RedirectAttributes rttr)
			throws Exception {

		if (principal.getName() != null) {
			dto.setUserId(principal.getName());
			dto.setUserPw(passwordEncoder.encode(dto.getUserPw())); // 패스워드 암호화
			service.update(dto);
			mv.setViewName("redirect:/person/mypage");
			rttr.addFlashAttribute("msg", "회원정보 수정에 성공했습니다.");
		} else {
			mv.setViewName("redirect:/");
			rttr.addFlashAttribute("msg", "회원정보 수정에 실패했습니다.");
		}

		return mv;
	}

	// 회원탈퇴 화면
	@GetMapping("/delete")
	public ModelAndView viewDelete(ModelAndView mv, Principal principal) throws Exception {
		System.out.println("로그인정보: " + principal.getName());

		if (principal.getName() != null) {
			mv.addObject("PsUserDto", service.selectOne(principal.getName()));
			mv.setViewName("person/delete");
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}

	// 회원탈퇴 화면 - 비밀번호 확인 화면
	@GetMapping("/deletepw")
	public ModelAndView viewDeletepw(ModelAndView mv, Principal principal) throws Exception {
		System.out.println("로그인정보: " + principal.getName());

		if (principal.getName() != null) {
			mv.addObject("PsUserDto", service.selectOne(principal.getName()));
			mv.setViewName("person/deletepw");
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}

	// 회원탈퇴
	@PostMapping("/deletepw")
	public ModelAndView delete(ModelAndView mv, String userId, String userPw, RedirectAttributes rttr)
			throws Exception {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		PsUserDto pdto = service.selectOne(auth.getName());

		if (passwordEncoder.matches(userPw, pdto.getUserPw())) {
			service.delete(userId);
			SecurityContextHolder.clearContext();
			mv.setViewName("redirect:/person/main");

		} else {
			mv.setViewName("redirect:/person/deletepw");
			rttr.addFlashAttribute("msg", "회원탈퇴에 실패하였습니다. 비밀번호를 다시 확인해주세요");
		}

		return mv;
	}

	// 마이페이지 - 입사지원현황 화면
	@GetMapping("/applylist")
	public ModelAndView viewApplyList(ModelAndView mv, @RequestParam(name = "userId") String userId) {
		try {
			PsUserDto result = service.selectOne(userId);

			if (result != null) {
				mv.addObject("userinfo", result);
				mv.setViewName("person/applylist");
			} else {
				mv.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 마이페이지 - 관심기업정보 화면
	@GetMapping("/scrapcompany")
	public ModelAndView viewScrapCompany(ModelAndView mv, Principal principal) {
		try {
			PsUserDto result = service.selectOne(principal.getName());

			if (result != null) {
				mv.addObject("userinfo", result);
				mv.setViewName("person/scrapcompany");
			} else {
				mv.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 마이페이지 - 스크랩한 채용공고 화면
	@GetMapping("/scrapjob")
	public ModelAndView viewScrapJob(ModelAndView mv, Principal principal) {
		try {
			PsUserDto result = service.selectOne(principal.getName());

			if (result != null) {
				mv.addObject("userinfo", result);
				mv.setViewName("person/scrapjob");
			} else {
				mv.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView kakaoLogin(ModelAndView mv, @RequestParam(value = "code", required = false) String code,
			RedirectAttributes rttr) throws Throwable {

		// 1번
		System.out.println("code : " + code);

		// code Null 인 경우 실행하지 않음
		if (code == null) {
			return mv;
		}

		// 2번
		String access_Token = service.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);

		// 3번
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));

		// 사용자 이메일 정보 조회
		String userEmail = (String) userInfo.get("email");
		PsUserDto user = service.selectUserEmail(userEmail);

		// 이메일 정보가 일치하는 사용자가 존재할 경우 로그인 처리
		if (user != null && user.getUserEmail().equals(userEmail)) {
			// 로그인
			mv.setViewName("redirect:/");
		} else {
			// 이메일 정보가 일치하지 않는 경우 로그인 실패 처리
			rttr.addFlashAttribute("msg", "이메일 정보가 일치하지 않습니다.");
			mv.setViewName("person/login");
		}
		return mv;
	}

	@GetMapping("/resume")
	public ModelAndView resume(ModelAndView mv) {
		return mv;
	}

	// 채용정보 페이지 - 1단계 
	@GetMapping("/recruit/info")
	public ModelAndView viewRecruitInfo(ModelAndView mv, Principal principal) {
		List<AdCategoryDto> fdeptList = cateservice.cateFdeptList();
		List<Map<String, Object>> resultList = new ArrayList<>();

		for (AdCategoryDto dto : fdeptList) {
			String categoryId = dto.getCategoryId();
			String categoryName = dto.getCategoryName();

			if ("LO".equals(categoryId) || "JN".equals(categoryId)) {
				Map<String, Object> resultMap = new HashMap<>();
				resultMap.put("categoryId", categoryId);
				resultMap.put("categoryName", categoryName);
				resultList.add(resultMap);
			}
		}
		
		List<BsRecruitDto> reCruitDto = brservice.recruitYAdmission();
		
	    
		int countYAdmission = brservice.countYAdmission();
		int lCatecountYAdmission = brservice.lCatecountYAdmission();

		mv.addObject("fdeptList", resultList);
		mv.addObject("recruitList", reCruitDto);
		mv.addObject("countYAdmission", countYAdmission);
		mv.addObject("lCatecountYAdmission", lCatecountYAdmission);

		return mv;
	}
	
	
	// 채용정보 페이지- 2단계 
	@PostMapping("/listmcate")
	@ResponseBody
	public String listMiddleCate(ModelAndView mv, String categoryId){
		
		List<AdCategoryDto> mlist = null;
		
		if(!categoryId.isEmpty() && !categoryId.equals("")){
			mlist = cateservice.cateMdeptList(categoryId);
		}

		return new Gson().toJson(mlist);
	}
	
	//채용정보 페이지- 3단계 
		@PostMapping("/listlcate")
		@ResponseBody
		public String listLastCate(ModelAndView mv, String categoryId){
			
			List<AdCategoryDto> llist = null;
			
			if(!categoryId.isEmpty() && !categoryId.equals("")){
				llist = cateservice.cateMdeptList(categoryId);
			}

			return new Gson().toJson(llist);
		}
		
	// 검색 
	@PostMapping("/search")
	@ResponseBody
	public  List<BsRecruitDto> search(ModelAndView mv, String keyword){
		System.out.println(keyword);
		
		 List<BsRecruitDto> searchList = null;
		 
		 if (!keyword.isEmpty() && !keyword.equals("")) {
			 searchList = brservice.searchList(keyword);
		 }

		    return searchList;
	}

	// 구인공고 확인 화면
	@GetMapping("/viewrecruit/{raNum}")
	public ModelAndView viewRecruit(ModelAndView mv, @PathVariable String raNum, 
									Principal principal) {
		
		try {
			
		PsUserDto result = service.selectOne(principal.getName());
		List<PsResumeDto> resume = rservice.selectList(principal.getName());
		// 공고 정보 출력
		BsRecruitDetailDto redto = abs.viewDetail(raNum);	
		
		
		if (result != null) {
			mv.addObject("redto", redto);
			mv.addObject("resumelist", resume);
			mv.setViewName("person/viewrecruit");
		} else {
			mv.setViewName("redirect:/");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}


	// 카테고리에 맞는 채용공고 출력 
	@PostMapping("/recruit/info")
	@ResponseBody
	public List<BsRecruitDto> lCateRecruit(ModelAndView mv,
				@RequestParam String categoryId
				) {	
		
		 List<BsRecruitDto> recruitList = null;

		    if (!categoryId.isEmpty() && !categoryId.equals("")) {
		        recruitList = brservice.lCateRecruit(categoryId);
		    }

		    return recruitList;

	}
	
	
	// 채용공고 스크랩
	@PostMapping("scrapJob")
	@ResponseBody
	public int scrapJob(Principal principal, @RequestParam("raNum") Integer raNum) throws Exception {
		
		int result = -1;
		
		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("raNum", raNum);
		InfoNo.put("userId", principal.getName());

		result = service.scrapJob(InfoNo);

		return result;
	}

	// 예외처리는 프로젝트 후반에 작성
	@ExceptionHandler
	public void exception(Exception e) {
		e.printStackTrace();
//		ModelAndView mv = new ModelAndView();
//		return mv;
	}

}