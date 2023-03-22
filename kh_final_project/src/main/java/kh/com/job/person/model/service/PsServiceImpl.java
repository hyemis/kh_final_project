package kh.com.job.person.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.person.model.dao.PsDao;
import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.temp.model.dao.TempDao;

@Service
public class PsServiceImpl implements PsService {
	
	@Autowired
	private PsDao dao;

	@Override
	public PsUserDto selectOne(String userId) throws Exception {
<<<<<<< Updated upstream:kh_final_project/src/main/java/kh/com/job/person/model/service/PsServiceImpl.java

		System.out.println("psServiceImpl userId: " + userId);

=======
		System.out.println("!@!@!@!@!@!@!@");
>>>>>>> Stashed changes:kh_final_project/src/main/java/kh/com/job/person/model/service/PsServieImpl.java
		return dao.selectOne(userId);
	}

	@Override
	public List<PsUserDto> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public int insert(PsUserDto dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(PsUserDto dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int delete(String userId) throws Exception {
		return dao.delete(userId);
	}
	
	
	

}
