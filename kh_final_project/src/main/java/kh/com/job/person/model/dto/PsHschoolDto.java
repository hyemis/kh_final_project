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
	
	
	
	
	// 고등학교 미입력시 null값으로 들어가게 하기
		public void setHname(Object highName) {
			if(highName.equals(""))
				this.highName = null;
			this.highName = (String)highName;
		}

	// 전공계열 미입력시 null값으로 들어가게 하기
		public void setHmajor(Object highMajor) {
			if(highMajor.equals(""))
				this.highMajor = null;
			this.highMajor = (String)highMajor;
		}
	

}