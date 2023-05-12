package kh.com.job.board.model.dto;

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

		private int boardNo;
		private String userId;
		private String userName;
		private String categoryId;
		private String boardTitle;
		private String boardContent;
		private String boardDate;
		private String updateDate;
		private int boardRead;
		private int boardLike;
		private String tag;
		private String salaryAvg;
		private String employee;
		private String link;
		private String linkTitle;
		
		//페이징처리
		private int startNum; //시작페이지
		private int endNum; //마지막페이지
		private int pnum; //페이지넘버
		
		
		//시간 형태 변경
		public void setboardDate(java.sql.Timestamp boardDate) {
			SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm");
			this.boardDate = format.format(boardDate);
		}
		
		public void setupdatedDate(java.sql.Timestamp updateDate) {
			SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm");
			this.updateDate = format.format(updateDate);
		}
		
	
		
		
	
}
