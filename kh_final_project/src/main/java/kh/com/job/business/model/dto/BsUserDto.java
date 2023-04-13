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
//	DESC USER_TABLE;
//	USER_ID         NOT NULL VARCHAR2(20)  
//	USER_PW         NOT NULL VARCHAR2(100) 
//	USER_PHONE      NOT NULL VARCHAR2(11)  
//	USER_BIRTH               TIMESTAMP(7)  
//	USER_EMAIL      NOT NULL VARCHAR2(254) 
//	USER_NAME                VARCHAR2(50)  
//	USER_CREATED_AT          TIMESTAMP(6)  
//	USER_LAST_LOGIN          TIMESTAMP(6)  
//	USER_COUNT               NUMBER        
//	USER_ACT                 VARCHAR2(5)   
//	USER_ROLE       NOT NULL VARCHAR2(10)  
//	TERMS_ACT       NOT NULL VARCHAR2(1)   
//	TERMS_DATE      NOT NULL TIMESTAMP(6)  
//	TERMS_PERIOD    NOT NULL NUMBER        
//	BS_TYPE                  VARCHAR2(200) 
//	BS_LICENSE               VARCHAR2(200) 
//	BS_MAIN_PHONE            VARCHAR2(11) 
//	ADDRESS_ROAD             VARCHAR2(100) 
//	ADDRESS_JIBUN            VARCHAR2(100) 
//	ADDRESS_DETAIL           VARCHAR2(100) 
//	ADDRESS_POSTCODE         VARCHAR2(100) 
	
	private String userId;
	private String userPw;
	private String userPhone;
	private String userEmail;
	private String userName;
	private String userPic;
	private Timestamp userCreatedAt;
	private Timestamp userLastLogin;
	private String userCount;
	private String userAct;
	private String userRole;
	private String bsType;
	private String bsLicense;
	private String bsMainPhone;
	private String addressRoad;
	private String addressJibun;
	private String addressDetail;
	private String addressPostcode;

}
