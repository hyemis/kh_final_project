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
public class BsRecruitDto {
//BUSINESS_RECRUIT_ANNOUNCEMENT
	
	private Number raNum;
	private String recruitType;
	private String busino;
	private String companyName;
	private String careerType;
	private String inchargeWork;
	private String department;
	private String raPosition;
	private String conditionType;
	private String userEducation;
	private String salary;
	private String minSalary;
	private String maxSalary;
	private String workDetail;
	private String registDate;
	private String closeDate;
	private String applyType;
	private String raTitle;
	private String raContent;
	private String raProcess;
	private String raExtraDocument;
	private String career;
	private String holidayType;
	
	
	
	
}
