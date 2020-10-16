package bit.com.inpho.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.MainDao;
import bit.com.inpho.dto.MainPostDto;

@Repository
public class MainDaoImpl implements MainDao{
	@Autowired
	SqlSessionTemplate sql;
	String ns = "Main.";
	@Override
	public List<MainPostDto> getNewFeed() {
		return sql.selectList(ns+"newFeedList");
	}
	
	
}
