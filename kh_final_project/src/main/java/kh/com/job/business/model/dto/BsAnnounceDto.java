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
public class BsAnnounceDto {
	
	private String userId;
	private String userPhone;
	private String userBirth;
	private String userEmail;
	private String userName;
	private String passType;
	private String resultTitle;
	private String resultContent;
	private int baNum;


}
