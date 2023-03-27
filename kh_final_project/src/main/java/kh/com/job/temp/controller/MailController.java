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
		String text = "테스트 메일 진행중입니다.테스트 메일 진행중입니다.테스트 메일 진행중입니다.테스트 메일 진행중입니다.테스트 메일 진행중입니다."
				+ "테스트 메일 진행중입니다.테스트 메일 진행중입니다.테스트 메일 진행중입니다.테스트 메일 진행중입니다.";
		String to = "tkdtlrdl07@gmail.com";
		String cc = ""; 
		
		MailUtil.mailSend(title, from, text, to, cc);
		
		return mv;
	}

}
