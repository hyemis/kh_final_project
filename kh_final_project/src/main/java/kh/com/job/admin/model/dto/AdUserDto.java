package kh.com.job.admin.model.dto;

import java.sql.Date;
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
public class AdUserDto {

	private String userId;
	private String userPw;
	private String userPhone;
	private Date   userBirth;
	private String userEmail;
	private String userName;
	private String userCount;
	private String userAct;
	private String userRole;

}
