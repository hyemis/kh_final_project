package kh.com.job;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.com.job.admin.model.dto.AdBannerDto;
import kh.com.job.admin.model.service.AdService;
import kh.com.job.business.model.dto.BsRecruitDetailDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.service.BsRecruitService;


@Controller
public class HomeController {
	
	@Autowired
	private AdService adservice;
	
	@Autowired
	private BsRecruitService brservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		
		List<AdBannerDto> bList = adservice.bannerList();
		
		List<BsRecruitDetailDto> recruitList = brservice.recentRecruit();
		
		mv.addObject("bList", bList);
		mv.addObject("recruitList", recruitList);
		
		mv.setViewName("home");
//		return "home";
		return mv;
	}
	
	
}
