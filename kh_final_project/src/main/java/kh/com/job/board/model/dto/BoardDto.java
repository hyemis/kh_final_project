package kh.com.job.board.model.dto;

import java.sql.Clob;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
	
		private int boardNum;
		private String userId;
		private String categoryId;
		private String boardTitle;
		private Clob   boardContent;
		private String boardDate;
		private String updateDate;
		private String boardOriginalFilename;
		private String boardRenameFilename;
		private Number boardRead;
		private Number boardLike;
		private String tag;
		private String salaryAvg;
		private String employee;
		private String link;
		
		//시간 형태 변경
		public void setboardDate(java.sql.Timestamp boardDate) {
			SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
			this.boardDate = format.format(boardDate);
		}
		public void setupdatedDate(java.sql.Timestamp updateDate) {
			SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
			this.updateDate = format.format(updateDate);
		}
}
