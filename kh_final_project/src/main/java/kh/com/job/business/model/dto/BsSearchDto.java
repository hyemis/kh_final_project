package kh.com.job.business.model.dto;

import org.springframework.stereotype.Component;

import kh.com.job.common.page.Paging;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class BsSearchDto {
	
	private int startNum;
	private int endNum;
	private int pnum;
	
	private String jobType;
	private String career;
	private String education;
	private String gender;
	private String resumeAct;
	private int resumeNo;
	private String resumeTitle;
	private String userId;
	private String userName;
	private String userEmail;
	
	
}
