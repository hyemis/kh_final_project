package kh.com.job.temp.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.temp.model.service.TempService;

@Controller
public class kakaoController {
	
	@Autowired
	public TempService service;
	
	
	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
		@RequestMapping(value = "/common/login", method = RequestMethod.GET)
		public ModelAndView kakaoLogin(ModelAndView mv
				, @RequestParam(value = "code", required = false) String code) throws Throwable {

			// 1번
			System.out.println("code : " + code);
			
			// 2번 
			String access_Token = service.getAccessToken(code);
			System.out.println("###access_Token#### : " + access_Token);
			
			// 3번 
			HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
			System.out.println("###nickname#### : " + userInfo.get("nickname"));
			System.out.println("###email#### : " + userInfo.get("email"));
			
			return mv;	

		}

}
