package kh.com.job.business.model.dto;


import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class BsRecruitAplicantDto {
//BUSINESS_RECRUIT_ANNOUNCEMENT
	
	private String raNum;
	private String userId;
	private String registDate;
	private String closeDate;
	private String raTitle;	
	private int aplicount;
	private int passcount;
	private int failcount;
	
	
	
	
}