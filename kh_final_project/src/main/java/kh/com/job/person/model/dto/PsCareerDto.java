package kh.com.job.person.model.dto;

import java.sql.Date;

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
public class PsCareerDto {
	
	
//	CAR_NO       NOT NULL NUMBER        
//	CAR_NAME              VARCHAR2(100) 
//	CAR_DATE              TIMESTAMP(6)  
//	CAR_POSITION          VARCHAR2(50)  
//	CAR_DEPT              VARCHAR2(50)  
//	CAR_RESP              VARCHAR2(200) 
//	CAR_SALARY            NUMBER     

	
	private int carNo;
	private String carName;
	private Date carDate;
	private String carPosition;
	private String carDept;
	private String carResp;
	private int carSalary;
}
