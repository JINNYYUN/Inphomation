package bit.com.inpho.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.PostDao;
import bit.com.inpho.dto.PostHashTagInfoDto;

@Repository
public class PostDaoImpl implements PostDao{
	@Autowired
	SqlSession sqlSession;
	String ns = "postwrite";
	@Override
	public List<PostHashTagInfoDto> getHashTag(int postseq, int hashtagseq) {
		List<PostHashTagInfoDto> list = sqlSession.selectList(ns+"getHashTagName" , postseq);
		return list;
	}

}
