package bit.com.inpho.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.DetailDao;
import bit.com.inpho.dto.BookmarkDto;

@Repository
public class DetailDaoImpl implements DetailDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Detail.";
	
	@Override
	public boolean addBookmark(BookmarkDto dto) {
		int n = sqlSession.insert(ns + "addBookmark", dto);
		return n>0?true:false;
	}

}
