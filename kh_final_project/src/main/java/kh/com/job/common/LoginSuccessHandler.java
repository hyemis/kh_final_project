package kh.com.job.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.Getter;
import lombok.Setter;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Getter
	@Setter
	private String userId;
	private String defaultUrl;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();
		
		session.setAttribute("userid", authentication.getName());
		
		if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_AM"))
				|| authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_A")) ) {
			response.sendRedirect("admin/main");
		}else if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_B"))) {
			response.sendRedirect("business/main");
		}else if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_P"))) {
			response.sendRedirect("person/main");
		}else {
			response.sendRedirect("person/mai");
		}
		
	}
	
	
	
	
	
	

}
