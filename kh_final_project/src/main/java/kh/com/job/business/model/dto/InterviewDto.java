package kh.com.job.business.model.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
//	CA_NUM               NOT NULL NUMBER        
//	CA_TITLE             NOT NULL VARCHAR2(300) 
//	CA_MEMO                       VARCHAR2(500) 
//	INTERVIEW_DATE_START NOT NULL DATE          
//	INTERVIEW_DATE_END   NOT NULL DATE          
//	INTERVIEW_TIME       NOT NULL VARCHAR2(50) 
//	INTERVIEW_LOCATION   NOT NULL VARCHAR2(100) 
//	INTERVIEWER                   VARCHAR2(50)  
//	ALARM_TYPE                    VARCHAR2(10)  
//	USER_NAME                     VARCHAR2(50)  
//	USER_ID                       VARCHAR2(50)  
//	AP_NUM                        NUMBER       
	
	private int caNum;
	private String caTitle;
	private String caMemo;
	private String interviewDate;
	private String interviewTime;
	private String interviewLocation;
	private String interviewer;
	private String alramType;
	private String userName;
	private String userId;
	private int apNum;
	
	
	
}
