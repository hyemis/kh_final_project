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
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BsRecruitDto {
//BUSINESS_RECRUIT_ANNOUNCEMENT
	
	private Number raNum;
	private String recruitType;
	private String careerType;
	private String inchargeWork;
	private String department;
	private String raPosition;
	private String conditionType;
	private String userEducation;
	private Timestamp userBirth;
	private String salary;
	private String workType;
	private String workDay;
	private String workTime;
 	private String raRepresentativeJob;
	private String applicationPeriod;
	private String raType;
	private String applyType;
	private String applyFormType;
	private String raTitle;
	private String raContent;
	private String raProcess;
	private String raExtraDocument;
	

	
	
	
	
	
}
