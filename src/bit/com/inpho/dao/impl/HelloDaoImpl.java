package bit.com.inpho.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.HelloDao;
import bit.com.inpho.dto.HelloDto;

@Repository
public class HelloDaoImpl implements HelloDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Hello.";
	
	@Override
	public String getName() {
		return sqlSession.selectOne(ns + "getEmail");
	}
}
