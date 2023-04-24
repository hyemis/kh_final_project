package kh.com.job.business.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BsSearchServiceDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	

}
