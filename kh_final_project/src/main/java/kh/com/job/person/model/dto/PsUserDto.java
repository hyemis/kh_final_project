package kh.com.job.person.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PsUserDto {
//USER_TABLE
	
		
	private String userId;
	private String userPw;
	private String userPhone;
	private String userBirth;
	private String userEmail;
	private String userAdress;
	private String userName;
	private String userBsType;
	private String userBsLicense;
	private Timestamp userCreatedAt;
	private Timestamp userLastLogin;
	private String userCount;
	private String userAct;
	private String userRole;
	private String termsAct;
	private Timestamp termsDate;
	private String termsPeriod;
	
}
