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
 */
		
	private int resumeNo;
	private String resumeTitle;
	private String resumePhoto;
	private String resumeAct;
	private Timestamp resumeDate;
	private String portfFile;
	private String userId;
	
}
