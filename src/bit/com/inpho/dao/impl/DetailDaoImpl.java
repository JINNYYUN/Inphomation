package bit.com.inpho.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.DetailDao;
import bit.com.inpho.dto.DetailBookmarkDto;
import bit.com.inpho.dto.DetailLikeDto;
import bit.com.inpho.dto.DetailReplyDto;

@Repository
public class DetailDaoImpl implements DetailDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Detail.";
	
	@Override
	public boolean addBookmark(DetailBookmarkDto dto) {
		int n = sqlSession.insert(ns + "addBookmark", dto);
		System.out.println("n: " + n);
		return n==1?true:false;
	}

	@Override
	public int countBookmark(DetailBookmarkDto dto) {
		System.out.println("dto: " + dto.toString());
		return sqlSession.selectOne(ns + "countBookmark", dto);
	}

	@Override
	public boolean deleteBookmark(DetailBookmarkDto dto) {
		int n = sqlSession.delete(ns + "deleteBookmark", dto);
		return n>0?true:false;
	}

	@Override
	public boolean addLike(DetailLikeDto dto) {
		int n = sqlSession.insert(ns + "addLike", dto);
		return n==1?true:false;
	}

	@Override
	public int countLike(DetailLikeDto dto) {
		return sqlSession.selectOne(ns + "countLike", dto);
	}

	@Override
	public boolean deleteLike(DetailLikeDto dto) {
		int n =sqlSession.delete(ns + "deleteLike", dto);
		return n>0?true:false;
	}

	@Override
	public int countLikeAll(int post_seq) {
		return sqlSession.selectOne(ns + "countLikeAll", post_seq);
	}

	@Override
	public boolean addReply(DetailReplyDto dto) {
		int n = sqlSession.insert(ns + "addReply", dto);
		return n>0?true:false;
	}

	@Override
	public List<DetailReplyDto> replyList(int post_seq) {
		List<DetailReplyDto> list= sqlSession.selectList(ns +"replyList", post_seq);
		return list;
	}


}
