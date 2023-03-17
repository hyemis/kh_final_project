package kh.com.job.temp.model.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardDto {

	
//	B_NUM|B_TITLE |B_WRITER |B_CONTENT |B_DATE               |
//	-----+--------+---------+----------+---------------------+
//	    1|글제목1   |글작성자1   |글내용1     |2023-03-13 10:50:57.0|
//	    2|글제목2   |글작성자2   |글내용2     |2023-03-13 10:51:37.0|
//	    3|글제목3   |글작성자3   |글내용3     |2023-03-13 10:51:38.0|
//	    4|글제목4   |글작성자4   |글내용4     |2023-03-13 10:51:39.0|
	
	private int bNum;
	private String bTitle;
	private String bWriter;
	private String bContent;
	private Date bDate;
	
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	
	@Override
	public String toString() {
		return "BoardDto [bNum=" + bNum + ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bContent=" + bContent
				+ ", bDate=" + bDate + "]";
	}
	
	public BoardDto() {
		super();
	}
	
	public BoardDto(int bNum, String bTitle, String bWriter, String bContent, Date bDate) {
		super();
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bContent = bContent;
		this.bDate = bDate;
	}
	
	
	
	
	
	
}
