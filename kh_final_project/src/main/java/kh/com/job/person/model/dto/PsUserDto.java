package kh.com.job.person.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

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
//USER_TABLE
/*
 * SER_ID|USER_PW                                                     |USER_PHONE 
 * |USER_BIRTH         |USER_EMAIL         |USER_ADRESS             
 * |USER_NAME|USER_BS_TYPE|USER_BS_LICENSE|USER_CREATED_AT
 * |USER_LAST_LOGIN|USER_COUNT|USER_ACT|USER_ROLE|TERMS_ACT
 * |TERMS_DATE             |TERMS_PERIOD|
------+------------------------------------------------------------+-----------+-------------------+-------------------+------------------------+---------+------------+---------------+---------------+---------------+----------+--------+---------+---------+-----------------------+------------+
dmin  |$2a$10$t27GWA4xK07TrCqxVF.ouuvIZJW1ldcgivH5yHr2W8hmyp1x5/nbi|01012345678|1990-01-01 00:00:00|johndoe@example.com|123 Main St, Anytown USA|John Doe |Retail      |12345          |               |               |          |true    |ROLE_AM  |Y        |    2023-03-19 00:00:00|           3|
user11|$2a$10$gohBEP3hvlo7j8B9vas49ucjYH9YLxrc1myDyerYG2aeu/hHrfn.a|01012345678|1990-07-07 00:00:00|buser@example.com  |123 Main St, 대한민국       |최민건      |모름          |12345          |               |               |          |true    |ROLE_B   |Y        |2023-03-19 18:08:07.823|           3|
ser11 |$2a$10$pLJeF.qJd2DaoYkgEzD2s.I13JUlypoYTtLHURW4P2xoojIoUoEsu|01099995555|1960-11-07 00:00:00|user11@example.com |어디에있긴함, 대한민국            |최민건      |되는거같음       |88888          |               |               |          |true    |ROLE_P   |Y        |2023-03-19 18:11:35.468|           3|
 */

	private String userId;
	private String userPw;
	private String userPhone;
	private String userBirth;
	private String userEmail;
	private String userAdress;
	private String userName;
	private String BsType;
	private String BsLicense;
	private String BsMainPhone;
	private Timestamp userCreatedAt;
	private Timestamp userLastLogin;
	private String userCount;
	private String userAct;
	private String userRole;
	private String termsAct;
	private Timestamp termsDate;
	private String termsPeriod;
	private String userPic;
	

}
