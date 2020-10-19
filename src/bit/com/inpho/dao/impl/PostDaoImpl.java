package bit.com.inpho.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.PostDao;
import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostHashTagInfoDto;
import bit.com.inpho.dto.PostLocationDto;

@Repository
public class PostDaoImpl implements PostDao{
	@Autowired
	SqlSession sqlSession;
	String ns = "postwrite.";
	@Override
	public List<PostHashTagInfoDto> getHashTag(int postseq, int hashtagseq) {
		return sqlSession.selectList(ns+"getHashTagName" , postseq);
		
	}
	@Override
	public List<MyPageCameraDto>getCamera(PostDto dto){
		return sqlSession.selectList(ns+"getCamera",dto);
		
	}
	@Override
	public void setmap(PostLocationDto map) {
		sqlSession.insert(ns+"setmap",map);
	}
	@Override
	public void setHashTag(int postseq, int hashtagseq) {
		sqlSession.insert(ns+"sethashtag",hashtagseq);
	}
	
	
}
