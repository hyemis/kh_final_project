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
public class BsAppInfoDto {
	
	private String userId;
	private String userPhone;
	private String userBirth;
	private String userEmail;
	private String userName;
	private String addressRoad;
	private String addressJibun;
	private String addressDetail;
	private String addressPostcode;
	private String bsMainPhone;
	private String userPic;
	private String userAct;

}
