package kh.com.job.person.model.dto;



import java.text.SimpleDateFormat;
import java.util.Date;

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
public class PsHschoolDto {
	
	
//	H_EDU_NO NOT NULL NUMBER       
//	GED      NOT NULL VARCHAR2(1)  
//	H_NAME            VARCHAR2(60) 
//	H_DATE            TIMESTAMP(6) 
//	H_MAJOR           VARCHAR2(10) 

	
	private int highEduNo;
	private String ged;
	private String highName;
	private String highDate;
	private String highMajor;
	
	
	
	
	

}