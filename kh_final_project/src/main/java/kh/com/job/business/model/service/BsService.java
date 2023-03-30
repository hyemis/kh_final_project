//Service 역할 - Transaction 기능  = Dao여러메소드를 하나의 기능으로 묶어서 처리함
package kh.com.job.business.model.service;

import java.util.List;

import kh.com.job.business.model.dto.BsRecruitDto;

public interface BsService {
	
	public int apiInsert(List<BsRecruitDto> bsList) throws Exception;

}
