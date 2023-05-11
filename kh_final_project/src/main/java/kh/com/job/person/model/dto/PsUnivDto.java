package kh.com.job.person.model.dto;

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
public class PsUnivDto {
	
	
//	UNI_EDU_NO   NOT NULL NUMBER       
//	UNI_ACT               VARCHAR2(1)  
//	UNI_CATEGORY          VARCHAR2(1)  
//	UNI_NAME              VARCHAR2(30) 
//	UNI_DATE              TIMESTAMP(6) 
//	UNI_MAJOR             VARCHAR2(50) 
//	UNI_POINT             NUMBER 

	
	private int uniEduNo;
	private String uniAct; 
	private String uniCategory;
	private String uniName;
	private String uniDate;
	private String uniMajor;
	private Double uniPoint;
	
	



}
