package kh.com.job.board.model.dto;

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
public class CompanyInfoDto {
	
	private String userId;
	private String userName;
	private String addressRoad;
	private String addressJibun;
	private String addressDetail;
	private String addressPostcode;
	private String bsMainPhone;
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String categoryId;
	private int boardRead;
	private int boardLike;
	private String tag;
	private String salaryAvg;
	private String employee;
	
//	private String raNum;	
//	private String registDate;
//	private String closeDate;
//	private String raTitle;

}
