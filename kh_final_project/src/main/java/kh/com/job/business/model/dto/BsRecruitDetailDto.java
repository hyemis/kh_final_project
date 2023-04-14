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
public class BsRecruitDetailDto {

/*
 * UT.USER_PHONE, UT.USER_EMAIL, UT.USER_NAME, UT.USER_PIC, UT.BS_MAIN_PHONE
    , UT.ADDRESS_ROAD, UT.ADDRESS_JIBUN, UT.ADDRESS_DETAIL, UT.ADDRESS_POSTCODE
    , RR.RA_NUM, RR.RECRUIT_TYPE, RR.COMPANY_NAME, RR.USER_EDUCATION, RR.SALARY
    , RR.REGIST_DATE, RR.CLOSE_DATE
    , RR.RA_TITLE, RR.RA_CONTENT, RR.RA_EXTRA_DOCUMENT
    , RR.CAREER, RR.HOLIDAY_TYPE, RR.EMP_TYPE_CODE
    , RR.RA_ADMISSION
 * 
 */
	
	private String userPhone;
	private String userEmail;
	private String userName;
	private String userPic;
	private String bsMainPhone;
	private String addressRoad;
	private String addressJibun;
	private String addressDetail;
	private String addressPostcode;
	private String raNum;
	private String recruitType;
	private String companyName;
	private String userEducation;
	private String salary;
	private String registDate;
	private String closeDate;
	private String raTitle;
	private String raContent;
	private String raExtraDocument;
	private String career;
	private String holidayType;
	private String empTypeCode;
	private String raAdmission;
	

	
	
	
	
}
