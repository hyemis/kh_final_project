package kh.com.job.business.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession;


@Repository
public class BsDao {
	
	@Autowired
	private SqlSession sqlSession;
	


}
