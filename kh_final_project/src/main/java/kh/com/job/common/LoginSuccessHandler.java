package kh.com.job.common;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kh.com.job.common.service.LoginSuccService;
import kh.com.job.person.model.service.PsService;


public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Resource(name="loginSer")
	private LoginSuccService service;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();
		
		session.setAttribute("userid", authentication.getName());
		String userid = authentication.getName();
		
		System.out.println("$$$$$$$$$$$$$");
		System.out.println(service);
		System.out.println("$$$$$$$$$$$$$");
		
		service.updateLoginRecord(userid);
		
		if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_AM"))
				|| authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_A")) ) {
			response.sendRedirect("admin/main");
		}else if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_B"))) {
			response.sendRedirect("business/main");
		}else if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_P"))) {
			try {
			//	service.updateLoginRecord(userid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("person/main");
			

		}else {
			response.sendRedirect("/");
		}
		
	}
	
	
	
	
	
	

}
