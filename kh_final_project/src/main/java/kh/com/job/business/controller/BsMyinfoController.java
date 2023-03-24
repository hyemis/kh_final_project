package kh.com.job.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/business/myinfo")
public class BsMyinfoController {
		
	@GetMapping("/companyinfo")
	public ModelAndView info(ModelAndView mv) {
			
		return mv;
	}
		
	@GetMapping("/infowrite")
	public ModelAndView infoWrite(ModelAndView mv) {
			
		return mv;
	}
	
	@PostMapping("/infowrite")
    public String save(
            @RequestParam(value = "text") String text,
            @RequestParam(value = "tag", required = false) String checkbox,
            @RequestParam(value = "file", required = false) MultipartFile file) {
        // 텍스트, 체크박스, 파일을 저장하는 로직을 작성
        // text 변수에는 텍스트 필드의 값이, tag 변수에는 체크박스의 값이,
        // file 변수에는 업로드한 파일이 저장됩니다.

        return "result";
    }
}


​
