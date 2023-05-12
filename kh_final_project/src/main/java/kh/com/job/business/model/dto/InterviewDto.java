package kh.com.job.business.model.dto;

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
public class InterviewDto {

	
	private int caNum;
	private int apNum;
	private int resumeNo;
	private String caTitle;
	private String dateStart;
	private String dateEnd;
	private String interviewTime;
	private String location;
	private String interviewer;
	private String memo;
	private String alramType;
	private String userName;
	private String userId;
	private String bsUser;
	private String UserEmail;
	private String UserName;
	
	private int startNum;
	private int EndNum;
	private int pnum;
	
	
	
}
