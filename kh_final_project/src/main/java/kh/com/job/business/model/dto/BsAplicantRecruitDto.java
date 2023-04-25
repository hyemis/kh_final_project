
package kh.com.job.business.model.dto;

import java.sql.Date;

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
public class BsAplicantRecruitDto {
	
	private int baNum;
	private String userId;
	private int resumeNo;
	private String resultType;
	private String raTitle;
	private int raNum;
	private String resumeTitle;
	private String resumeAct;
	private Date applyDate;
	private int aplicount;
	private int passcount;
	private int failcount;

	
	
}