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
public class BsPassApplicantDto {
	 
		private int baNum;
		private int apNum;
		private String userId;
		private String resumeNo;
		private String passType;
		private String passName;
		private String raTitle;

}
