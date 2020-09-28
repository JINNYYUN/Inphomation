package bit.com.inpho.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.HelloDao;

@Repository
public class HelloDaoImpl implements HelloDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Hello.";
	
	@Override
	public String getName(String id) {
		return sqlSession.selectOne(ns + "getName", id);
	}

	
}
