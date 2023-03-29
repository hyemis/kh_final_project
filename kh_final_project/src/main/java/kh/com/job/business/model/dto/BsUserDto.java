package kh.com.job.business.model.dto;

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
public class BsUserDto {
	
	private String userId;
	private String userPw;
	private String userPhone;
	private String userEmail;
	private String adressRoad;
	private String adressJibun;
	private String adressDetail;
	private String adressPostcode;
	private String userName;
	private String bsType;
	private String bsLicense;
	private String bsMainPhone;
	private Timestamp userCreatedAt;
	private Timestamp userLastLogin;
	private String userCount;
	private String userAct;
	private String userRole;

}
