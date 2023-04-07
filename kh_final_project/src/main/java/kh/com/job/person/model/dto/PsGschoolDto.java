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
public class PsGschoolDto {
	
	
//	GRAD_EDU_NO   NOT NULL NUMBER       
//	GRAD_ACT               VARCHAR2(1)  
//	GRAD_NAME              VARCHAR2(30) 
//	GRAD_CATEGORY          CHAR(6)      
//	GRAD_DATE              TIMESTAMP(6) 
//	GRAD_MAJOR             VARCHAR2(50) 
//	GRAD_POINT             NUMBER 

	
	private int gradEduNo;
	private String gradAct;
	private String gradName;
	private String gradCategory;
	private Date gradDate;
	private String gradMajor;
	private double gradPoint;


	// 졸업일자 입력 안 하면 null로 받기
	public void setGradDate(Object gradDate) {
		if(gradDate.equals(""))
			this.gradDate = null;
		this.gradDate = (Date)gradDate;
		}
	}
