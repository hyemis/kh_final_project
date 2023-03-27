package kh.com.job.common.error;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public ModelAndView CustumExceptionHandler(ModelAndView mv, Exception ex) {
		System.out.println("에러 코드 " + ex);
		System.out.println(ex.getMessage());
		System.out.println("@@@@@@@@@@@@@@");
		mv.addObject("msg", ex.getMessage());
		
		
		return mv;
	}

}
