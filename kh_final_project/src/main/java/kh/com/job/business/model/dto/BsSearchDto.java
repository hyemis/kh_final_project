package kh.com.job.business.model.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class BsSearchDto {
	
	private String jobType;
	private String career;
	private String education;
	private String gender;
	private String resumeAct;
	private String sendInterview;
	private int    resumeNo;
	private String resumeTitle;
	private String userId;
	private String userName;
	private String userEmail;
	
	private int startNum;
	private int endNum;
	private int pnum;
}
