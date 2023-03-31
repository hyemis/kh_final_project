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
public class PsClDto {
	
//	CL_NO     NOT NULL NUMBER        
//	CL_FILE            VARCHAR2(200) 
//	CL_GROWTH          CLOB          
//	CL_MOTIVE          CLOB          
//	CL_ADV             CLOB          
//	CL_ASP             CLOB        

	
	private int clNo;
	private String clFile;
	private String clGrowth;
	private String clMotive;
	private String clAdv;
	private String clAsp;
	
}
