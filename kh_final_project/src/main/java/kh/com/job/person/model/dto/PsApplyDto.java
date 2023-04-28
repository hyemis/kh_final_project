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
public class PsApplyDto {
	
	
	private int baNum;
	private int raNum;
	private Date applyDate;
	private String companyName;
	private String raTitle;
	private String resultType;
}
