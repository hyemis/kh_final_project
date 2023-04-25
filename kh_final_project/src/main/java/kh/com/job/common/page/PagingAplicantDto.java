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
public class PagingAplicantDto {
	
	private int startNum;
	private int endNum;
	private String searchNum;
	private String searchResult;
	private int pnum;
	private String userId;
	

}
