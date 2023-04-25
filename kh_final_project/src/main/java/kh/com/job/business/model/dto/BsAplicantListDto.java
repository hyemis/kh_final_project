package kh.com.job.business.model.dto;


import java.sql.Date;
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
public class BsAplicantListDto {
//BUSINESS_RECRUIT_ANNOUNCEMENT
/*
 *ba.baNum ba.user_id, ba.resume_no, ba.RESULT_TYPE
	,rr.ra_num   , rr.ra_title, ua.apply_date
 */	
	private int baNum;
	private String raNum;
	private String userId;
	private String resumeNo;
	private String resultType;
	private String raTitle;	
	private Date applyDate;
	
	
	
	
}