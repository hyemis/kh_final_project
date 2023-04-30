package kh.com.job.common.page;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class Criteria {
	
	private int page;
	private int pageNum;
	private int startNum;
	private int endNum;

   
   public Criteria()
   {
    this.page = 1;
    this.pageNum = 10;
   }

   public void setPage(int page)
   {
    if (page <= 0)
    {
     this.page = 1;
     return;
    }
    this.page = page;
   }

   public void setPerPageNum(int pageNum)
   {
    if (pageNum <= 0 || pageNum > 100)
    {
     this.pageNum = 10;
     return;
    }
    this.pageNum = pageNum;
   }

   public int getPage()
   {
    return page;
   }

   public int getPageStart()
   {
    return (this.page - 1) * pageNum;
   }

   public int getPerPageNum()
   {
    return this.pageNum;
   }

   public int getRowStart() {
    startNum = ((page - 1) * pageNum) + 1;
    return startNum;
   }

   public int getRowEnd() {
    endNum = startNum + pageNum - 1;
    return endNum;
   }
}