package kh.com.job.temp.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.temp.model.service.TempService;

@Controller
@RequestMapping("/temp")
public class TempController {

	@Autowired
	private TempService service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@GetMapping("/list")
	public ModelAndView memberList(ModelAndView mv) {
		
		

		return mv;
	}
	
	@PostMapping("/list")
	public void testshow(ModelAndView mv, String userBirth2) {
		
		Timestamp timestamp = null;
		
		// 문자열 값을 java.sql.Timestamp로 변환
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date parsedDate = dateFormat.parse(userBirth2);
			timestamp = new Timestamp(parsedDate.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println(timestamp);
		

	}

	


	@GetMapping("/applyprocesslist")
	public ModelAndView applyProcessList(ModelAndView mv) {

		try {
			mv.addObject("aplist", service.applyProcessList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@GetMapping("/index")
	public ModelAndView viewIndex(ModelAndView mv) {

		return mv;
	}

	@GetMapping("/praticeindex")
	public ModelAndView praticeIndex(ModelAndView mv) {

		return mv;
	}

	@GetMapping("/praticeadmin")
	public ModelAndView praticeAdmin(ModelAndView mv) {

		return mv;
	}

	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {

		return mv;
	}

	@GetMapping("/error")
	public ModelAndView error(ModelAndView mv) {
		
		return mv;
	}
	
	@GetMapping("/mypage")
	public ModelAndView mypage(ModelAndView mv) {
		
		return mv;
	}
	
	@GetMapping("/recruitmentpost")
	public ModelAndView recruitmentPost(ModelAndView mv) {
		
		return mv;
	}
	
	@GetMapping("/companyinfo")
	public ModelAndView companyInfo(ModelAndView mv) {
	
		return mv;
	}
	
	@GetMapping("/boardsample")
	public ModelAndView boardSample(ModelAndView mv) {
	
		return mv;
	}
	
	@GetMapping("/boardwrite")
	public ModelAndView boardWrite(ModelAndView mv) {
	
		return mv;
	}
	
	  @PostMapping("/login") 
	  public ModelAndView loginForm(ModelAndView mv, PsUserDto pdto) {

	  String userid = pdto.getUserId(); 
	  String rawPassword = pdto.getUserPw();
//	  String username = pdto.getUserName();	  
	  
	  System.out.println("@@@@@@@ id " + userid);
	  System.out.println("@@@@@@@ raw " + rawPassword);
	  
	  System.out.println("@@@@@@@@@@@@@@@@      " + passwordEncoder.encode(rawPassword));
	  
	  String encPassword = service.loginCheck(userid).getUserPw(); 
	  System.out.println("!!!!!!!!!! encode " + encPassword);
	  
	  
	  boolean check = passwordEncoder.matches(rawPassword, encPassword);
	  
	  System.out.println("check : " + check);
	  
	  return mv; 
	  }

	  
	  @GetMapping("/sample")
		public ModelAndView sample(ModelAndView mv) {
			return mv;
		}
	  
	  
	  //security-config 로그인 폼 로그인 후 페이지
	  @GetMapping("/maintest")
	  public ModelAndView maintest(ModelAndView mv) {
		  
		  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		  
		  
		  Object principal = auth.getPrincipal();
		  
		  String id = "";
		  
		  if(principal != null) {
			id = auth.getName();
			System.out.println("role @@@@@ : " +  auth.getAuthorities());
			if(auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_AM"))) {
				mv.addObject("role", "ROLE_AM");
			}else if(auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_A"))) {
				mv.addObject("role", "ROLE_A");
			}else if(auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_B"))) {
				mv.addObject("role", "ROLE_B");
			}else if(auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_P"))) {
				mv.addObject("role", "ROLE_P");
			}
				
		  }
		  
		  
		  System.out.println("@@@@@@@@@@@@####  principal :" +  principal);
		  System.out.println("@@@@@@@@@@@@####  detail" +  auth.getDetails());
		  
		  mv.addObject("id",id);
		  
		  return mv;
	  }
	  
	  @GetMapping("/fileupload")
	  public ModelAndView viewfileupload(ModelAndView mv) {
		  return mv;
	  }
	
	  @PostMapping("/fileupload")
	  public String fileupload(@RequestParam(name = "report", required = false) MultipartFile file) throws IOException  {
		  
		  // Google Cloud Storage에 업로드할 파일 이름 생성
		    String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();


		    // Google Cloud Storage 연결 설정
		    InputStream serviceAccount = getClass().getResourceAsStream("/resources/khfinal5joba-efa3ba3dbf4e.json");
		    Storage storage = (Storage) StorageOptions.newBuilder().setProjectId("khfinal5joba").setCredentials(GoogleCredentials.fromStream(serviceAccount)).build();
		    
		    // Google Cloud Storage 버킷 가져오기
		    Bucket bucket = storage.get("khfinal5joba");
		  
		    // Google Cloud Storage에 파일 업로드
		    Blob blob = bucket.create(fileName, file.getBytes(), file.getContentType());
		    
		    // 업로드한 파일의 URL 반환
		    return blob.getMediaLink();
	  }
	  

}
