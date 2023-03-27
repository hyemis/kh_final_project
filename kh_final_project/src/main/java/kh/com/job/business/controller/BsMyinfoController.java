package kh.com.job.business.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.service.AdAccountService;
import kh.com.job.business.model.dto.BsInfoDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.business.model.service.BsInfoService;



@Controller
@RequestMapping("/business/myinfo")
public class BsMyinfoController {
	
	@Autowired
	private BsInfoService service;
	
	//회사소개 상세페이지
	@GetMapping("/companyinfo")
	public ModelAndView infoView(ModelAndView mv) {
		mv.addObject("imfoview", service.selectList());	
		return mv;
	}
	
	@GetMapping("/insert")
	public Model infoWrite(BsInfoDto infoDto, Model model, HttpSession session) throws Exception{
		BsUserDto dto = (BsUserDto)session.getAttribute("Login");
		model.addAttribute("userId",dto);
		model.addAttribute("boardDate",dto);
		return model;
	}
	
   	@PostMapping("/insert")
	public String insert(BsInfoDto Dto) {
		  return "redirect:/companyinfo";
		}
   	
  //공고관리
  		@GetMapping("/infowrite")
  		public ModelAndView infowrite(ModelAndView mv) {
  			
  			return mv;
  		}
	
	/* 모달창으로 합치는중
	//회사소개 작성페이지
	@GetMapping("/infowrite")
	public ModelAndView infoWrite(ModelAndView mv) {
			
		return mv;
	}
	
	//회사소개 작성 저장
	@PostMapping("/save")
	public String save(BsInfoDto Dto) {
		  return "redirect:/success";
		}
		
	@PostMapping("/insert")
	public String registReviewPost(BsInfoDto infoDto, Model model, HttpSession session) throws Exception{
		BsInfoService.infoWrite(bsInfoDto);
		return "companyinfo";
	}

	 */
}
	
	
	