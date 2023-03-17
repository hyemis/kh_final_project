package kh.com.job.person.model.dto;

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
public class PsUserDto {
	
//	USER_ID|USER_PW|USER_PHONE |USER_BIRTH|USER_EMAIL      |USER_ADDRESS|USER_NAME| user_role
//	-------+-------+-----------+----------+----------------+------------+---------+
//	user1  |user1  |01012345678|000101    |user1@joba.co.kr|서울특별시 강남구   |사용자1     |
//	user2  |user2  |01023456789|000102    |user2@joba.co.kr|서울특별시 종로구   |사용자2     |
//	user3  |user3  |01034567890|000103    |user3@joba.co.kr|서울특별시 마포구   |사용자3     |	

	
	
	private String username;
	private String password;
	private String userPhone;
	private String userBirth;
	private String userEmail;
	private String userAddress;
	private String userName;
	private String userRole;
	
	
	
}
