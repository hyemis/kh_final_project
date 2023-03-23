package kh.com.job.admin.model.dto;

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
public class AdCategoryDto {
	
//	CATEGORY_ID     NOT NULL VARCHAR2(20) 
//	CATEGORY_NAME   NOT NULL VARCHAR2(50) 
//	CATEGORY_DEPT            VARCHAR2(10) 
//	CATEGORY_TYPE            VARCHAR2(50) 
//	REQ_CATEGORY_ID          VARCHAR2(20)

	private String categoryId;
	private String categoryName;
	private String categoryDept;
	private String categoryType;
	private String reqCategoryId;
	
	
}
