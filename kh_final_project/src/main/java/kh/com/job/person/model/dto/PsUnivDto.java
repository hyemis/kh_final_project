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
public class PsUnivDto {
	
	
//	U_EDU_NO   NOT NULL NUMBER       
//	U_ACT               VARCHAR2(1)  
//	U_CATEGORY          VARCHAR2(1)  
//	U_NAME              VARCHAR2(30) 
//	U_DATE              TIMESTAMP(6) 
//	U_MAJOR             VARCHAR2(50) 
//	U_POINT             NUMBER 

	
	private int uEduNo;
	private String uAct;
	private String uCategory;
	private String uName;
	private Date uDate;
	private String uMajor;
	private double uPoint;
	public Date getuDate;
	
	// 졸업일자 입력 안 하면 null값 받기
	public void setUdate(Object uDate) {
		if(uDate.equals(""))
			this.uDate = null;
		this.uDate = (Date)uDate;
	}
	
	
}
