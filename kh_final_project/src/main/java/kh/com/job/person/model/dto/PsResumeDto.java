package kh.com.job.person.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

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
public class PsResumeDto {

/*
 * 	RESUME_NO|RESUME_TITLE|RESUME_PHOTO|RESUME_ACT|RESUME_DATE        |PORTF_FILE|USER_ID|
---------+------------+------------+----------+-------------------+----------+-------+
        1|이력서 제목      |            |Y         |2023-03-21 12:39:11|          |test2  |


RESUME_NO    NOT NULL NUMBER        
RESUME_TITLE NOT NULL VARCHAR2(60)  
RESUME_PHOTO          VARCHAR2(200) 
RESUME_ACT            VARCHAR2(1)   
RESUME_DATE           TIMESTAMP(6)  
PORTF_FILE            VARCHAR2(200) 
USER_ID      NOT NULL VARCHAR2(20)  
EDUCATION             VARCHAR2(100) 
JOB_TYPE              VARCHAR2(100) 
GENDER                VARCHAR2(100) 
CAREER                VARCHAR2(100) 
 
 */
		
	private int resumeNo;
	private String resumeTitle;
	private String resumePhoto;
	private String resumeAct;
	private Timestamp resumeDate;
	private String portfFile;
	private String userId;
	private String education;
	private String jobType;
	private String gender;
	private String career;
	
}
