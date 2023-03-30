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
public class PsCertiDto {
	
	
//	CERTI_NO   NOT NULL NUMBER        
//	CERTI_NAME          VARCHAR2(100) 
//	CERTI_PUB           VARCHAR2(100) 
//	CERTI_DATE          TIMESTAMP(6)      

	
	private int certiNo;
	private String certiName;
	private String certiPub;
	private Date certiDate;

}
