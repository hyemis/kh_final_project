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
public class psClDto {
	
//	CL_NO     NOT NULL NUMBER        
//	CL_FILE            VARCHAR2(200) 
//	CL_GROWTH          CLOB          
//	CL_MOTIVE          CLOB          
//	CL_ADV             CLOB          
//	CL_ASP             CLOB        

	
	private int clNo;
	private String clFile;
 //TODO clob 자료형 dto추가하기

}
