package kh.com.job.temp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.common.mail.MailUtil;

@Controller
@RequestMapping("/temp")
public class MailController {
	
	@GetMapping("/sendmail")
	public ModelAndView SendMailView(ModelAndView mv) {
		
		return mv;
	}
	
	@PostMapping("/sendmail")
	public ModelAndView SendMailTest(ModelAndView mv) {
		String title = "테스트 메일 진행중입니다.";
		String from = "tkdtlrdl07@gmail.com";
		String text = "<h1>테스트 메일 진행중입니다.</h1>테스트 메일 진행중입니다.테스트 메일 진행중입니다.테스트 메일 진행중입니다.테스트 메일 진행중입니다."
				+ "테스트 메일 진행중입니다.테스트 메일 진행중입니다.테스트 메일 진행중입니다.테스트 메일 진행중입니다.";
		String to = "tkdtlrdl07@gmail.com";
		int ccNum = 3;
		String[] cc = new String[ccNum]; 
		cc[0] ="hanwxxl@gmail.com"; 		
		cc[1] ="chanhui9797@gmail.com"; 		
		cc[2] ="hyem.is.1220@gmail.com"; 		
		 // "hanwxxl@gmail.com, chanhui9797@gmail.com, hyem.is.1220@gmail.com";
		MailUtil.mailSend(title, from, text, to, cc, ccNum);
		
		return mv;
	}

}
