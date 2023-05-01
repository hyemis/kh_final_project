package kh.com.job.common.page;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class PagingBoardDto {
	
	private int startNum;
	private int endNum;
	private int pnum;
	private String categoryId;
	
}
