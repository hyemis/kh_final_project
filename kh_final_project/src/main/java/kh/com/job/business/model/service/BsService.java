//Service 역할 - Transaction 기능  = Dao여러메소드를 하나의 기능으로 묶어서 처리함
package kh.com.job.business.model.service;

import kh.com.job.business.model.dto.BsRecruitDto;

public interface BsService {
	
	public int apiInsert(BsRecruitDto dto) throws Exception;

}
