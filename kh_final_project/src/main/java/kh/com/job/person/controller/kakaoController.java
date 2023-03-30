package kh.com.job.person.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.person.model.service.PsService;
import kh.com.job.temp.model.service.TempService;

@Controller
public class kakaoController {
	
	@Autowired
	public PsService service;
	
		
		// 카카오지도
		@RequestMapping(value = "/temp/map", method = RequestMethod.GET)
		public ModelAndView kakaoMap(ModelAndView mv) {
			return mv;
		}
		
		// 다음 주소검색
		@RequestMapping(value = "/temp/postmail", method = RequestMethod.GET)
		public ModelAndView postmail(ModelAndView mv) {
			return mv;
		}
		
		// 주소검색후 지도변환
		@RequestMapping(value = "/common/map", method = RequestMethod.GET)
		public ModelAndView map(ModelAndView mv) {
			return mv;
		}
}
