package kh.com.job.common.service;

import org.springframework.stereotype.Service;

@Service("loginSer")
public class LoginSuccServiceImpl implements LoginSuccService{

	@Override
	public void updateLoginRecord(String userid) {	
		
		System.out.println("*****************");
		System.out.println(userid);
		System.out.println("*****************");
		
	}

}
