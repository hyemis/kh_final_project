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
	
	
//	G_EDU_NO   NOT NULL NUMBER       
//	G_ACT               VARCHAR2(1)  
//	G_NAME              VARCHAR2(30) 
//	G_CATEGORY          CHAR(6)      
//	G_DATE              TIMESTAMP(6) 
//	G_MAJOR             VARCHAR2(50) 
//	G_POINT             NUMBER 

	
	private int gEduNo;
	private String gAct;
	private String gName;
	private String gCategory;
	private Date gDate;
	private String gMajor;
	private double gPoint;


	// 졸업일자 입력 안 하면 null로 받기
	public void setGdate(Object gDate) {
		if(gDate.equals(""))
			this.gDate = null;
		this.gDate = (Date)gDate;
		}
	}
