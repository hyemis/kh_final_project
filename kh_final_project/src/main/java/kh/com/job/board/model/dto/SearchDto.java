package kh.com.job.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchDto {
	
	private int pageNum; // 현재 페이지 번호.
	private int amount; // 페이지당 게시물수
	private String keyword; // 검색 키워드
	private String type; // 검색 타입
	
	//이력서찾기에 필요한 키워드 선언
	private String jobType; 
	private String career;
	private String education;
	private String gender;
	
	public SearchDto() {
		this(1,10);
	}

	public SearchDto(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
