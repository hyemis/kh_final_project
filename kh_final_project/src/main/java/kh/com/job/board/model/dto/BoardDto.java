package kh.com.job.board.model.dto;

import java.sql.Clob;
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
public class BoardDto {
	//Board
	
		private Number boardNum;
		private String userId;
		private String categoryId;
		private String boardTitle;
		private Clob   boardContent;
		private Timestamp boardDate;
		private String boardOriginalFilename;
		private String boardRenameFilename;
		private Number boardRead;
		private Number boardLike;
		private String tag;
		private String salaryAvg;
		private String employee;
		private String latitude;
		private String longitude;
}
