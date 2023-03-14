package kh.com.job.temp.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 * Script.sql 에서 personal_member테이블 생성해야 오류 안나요.
 * kh.com.job.temp.model.dto.TempDto 관련해서 오류가 나면 
 * 테이블 만들고 서버클린 프로젝트 클린 한번씩 해주세요
 */

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
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

	
	
	
}
