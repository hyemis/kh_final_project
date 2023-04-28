package kh.com.job.board.model.dto;

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
public class ReplyDto {
//	REPLY_ID|BOARD_NO|USER_ID|REPLY_CONTENT|REPLY_CREATE_DATE  |REPLY_LEVEL|REPLY_SEQ|
	
		private int replyId;
		private int boardNo;
		private String userId;
		private String replyContent;
		private String replyCreateDate;
		private int replyLevel;
		private int replySeq;
		
		//시간 형태 변경
		public void setReplyCreateDate(java.sql.Timestamp replyCreateDate) {
			SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm");
			this.replyCreateDate = format.format(replyCreateDate);
		}
		
	
}
