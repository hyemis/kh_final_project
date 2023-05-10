package kh.com.job.business.model.dto;

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
public class InterviewDto {
// 	DESC INTERVIEW;
//	
//	CA_NUM         NOT NULL NUMBER        
//	CA_TITLE       NOT NULL VARCHAR2(300) 
//	DATE_START     NOT NULL VARCHAR2(50)  
//	DATE_END       NOT NULL VARCHAR2(50)  
//	INTERVIEW_TIME          VARCHAR2(50)  
//	LOCATION                VARCHAR2(100) 
//	INTERVIEWER             VARCHAR2(50)  
//	MEMO                    VARCHAR2(500) 
//	ALARM_TYPE              VARCHAR2(10)  
//	USER_NAME               VARCHAR2(50)  
//	USER_ID                 VARCHAR2(50)  
//	AP_NUM                  NUMBER 
//	BS_USER
	
	private int caNum;
	private int apNum;
	private String caTitle;
	private String dateStart;
	private String dateEnd;
	private String interviewTime;
	private String location;
	private String interviewer;
	private String memo;
	private String alramType;
	private String userName;
	private String userId;
	private String bsUser;
	private String UserEmail;
	
	
}
