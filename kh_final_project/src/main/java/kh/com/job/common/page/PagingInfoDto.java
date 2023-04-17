package kh.com.job.common.page;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class PagingInfoDto {
	
	private int startNum;
	private int endNum;
	private String search;
	private int pnum;
	private String userId;
	

}
