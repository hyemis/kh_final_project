package kh.com.job.temp.model.dto;

import org.springframework.stereotype.Component;

@Component
public class TempDto {
	
	private String userId;
	private String userPw;
	private String name;
	private String email;
	private String phoneNum1;
	private String phoneNum2;
	private String phoneNum3;
	
	
	@Override
	public String toString() {
		return "TempDto [userId=" + userId + ", userPw=" + userPw + ", name=" + name + ", email=" + email
				+ ", phoneNum1=" + phoneNum1 + ", phoneNum2=" + phoneNum2 + ", phoneNum3=" + phoneNum3 + "]";
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNum1() {
		return phoneNum1;
	}
	public void setPhoneNum1(String phoneNum1) {
		this.phoneNum1 = phoneNum1;
	}
	public String getPhoneNum2() {
		return phoneNum2;
	}
	public void setPhoneNum2(String phoneNum2) {
		this.phoneNum2 = phoneNum2;
	}
	public String getPhoneNum3() {
		return phoneNum3;
	}
	public void setPhoneNum3(String phoneNum3) {
		this.phoneNum3 = phoneNum3;
	}

	
	
	
}
