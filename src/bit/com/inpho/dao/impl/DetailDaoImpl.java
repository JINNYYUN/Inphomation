package bit.com.inpho.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.DetailDao;
import bit.com.inpho.dto.DetailCountAllDto;
import bit.com.inpho.dto.DetailPostDto;
import bit.com.inpho.dto.DetailReplyDto;

@Repository
public class DetailDaoImpl implements DetailDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Detail.";
	
	@Override
	public boolean addBookmark(DetailCountAllDto dto) {
		int n = sqlSession.insert(ns + "addBookmark", dto);
		System.out.println("n: " + n);
		return n==1?true:false;
	}

	@Override
	public int countBookmark(DetailCountAllDto dto) {
		System.out.println("dto: " + dto.toString());
		return sqlSession.selectOne(ns + "countBookmark", dto);
	}

	@Override
	public boolean deleteBookmark(DetailCountAllDto dto) {
		int n = sqlSession.delete(ns + "deleteBookmark", dto);
		return n>0?true:false;
	}

	@Override
	public boolean addLike(DetailCountAllDto dto) {
		int n = sqlSession.insert(ns + "addLike", dto);
		return n==1?true:false;
	}

	@Override
	public int countLike(DetailCountAllDto dto) {
		return sqlSession.selectOne(ns + "countLike", dto);
	}

	@Override
	public boolean deleteLike(DetailCountAllDto dto) {
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

	@Override
	public boolean deleteReply(DetailReplyDto dto) {
		int n =sqlSession.delete(ns + "deleteReply", dto);
		return n>0?true:false;
	}

	@Override
	public DetailPostDto getPost(int post_seq) {
		return sqlSession.selectOne(ns + "getPost", post_seq);
	}

	@Override
	public List<DetailPostDto> getHashTag(int post_seq) {
		List<DetailPostDto> list = sqlSession.selectList(ns + "getHashTag", post_seq);
		return list;
	}

	@Override
	public void deleteDetail(int post_seq) {
		sqlSession.update(ns + "deleteDetail", post_seq);
	}

	@Override
	public List<DetailReplyDto> likeList(int post_seq) {
		List<DetailReplyDto> list = sqlSession.selectList(ns + "likeList", post_seq);
		return list;
	}

	@Override
	public List<DetailPostDto> getAllPost(DetailPostDto dto) {
		List<DetailPostDto> list = sqlSession.selectList(ns + "getAllPost", dto);
		return list;
	}

	@Override
	public void updateContent(DetailPostDto dto) {
		sqlSession.update(ns + "updateContent", dto);
	}

	@Override
	public void delTag(int post_seq) {
		sqlSession.delete(ns + "delTag", post_seq);
	}

}
