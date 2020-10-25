package bit.com.inpho.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.DetailDao;
import bit.com.inpho.dto.DetailCountAllDto;
import bit.com.inpho.dto.DetailPostDto;
import bit.com.inpho.dto.DetailReplyDto;
import bit.com.inpho.service.DetailService;
@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	DetailDao dao;
	
	@Override
	public boolean addBookmark(DetailCountAllDto dto) {
		return dao.addBookmark(dto);
	}

	@Override
	public int countBookmark(DetailCountAllDto dto) {
		return dao.countBookmark(dto);
	}

	@Override
	public boolean deleteBookmark(DetailCountAllDto dto) {
		return dao.deleteBookmark(dto);
	}

	@Override
	public boolean addLike(DetailCountAllDto dto) {
		return dao.addLike(dto);
	}

	@Override
	public int countLike(DetailCountAllDto dto) {
		return dao.countLike(dto);
	}

	@Override
	public boolean deleteLike(DetailCountAllDto dto) {
		return dao.deleteLike(dto);
	}

	@Override
	public int countLikeAll(int post_seq) {
		return dao.countLikeAll(post_seq);
	}

	@Override
	public boolean addReply(DetailReplyDto dto) {
		return dao.addReply(dto);
	}

	@Override
	public List<DetailReplyDto> replyList(int post_seq) {
		return dao.replyList(post_seq);
	}

	@Override
	public boolean deleteReply(DetailReplyDto dto) {
		return dao.deleteReply(dto);
	}

	@Override
	public DetailPostDto getPost(int post_seq) {
		return dao.getPost(post_seq);
	}

	@Override
	public List<DetailPostDto> getHashTag(int post_seq) {
		return dao.getHashTag(post_seq);
	}

	@Override
	public void deleteDetail(int post_seq) {
		dao.deleteDetail(post_seq);
	}

	@Override
	public List<DetailReplyDto> likeList(int post_seq) {
		return dao.likeList(post_seq);
	}

	@Override
	public List<DetailPostDto> getAllPost(DetailPostDto dto) {
		return dao.getAllPost(dto);
	}

	@Override
	public void updateContent(DetailPostDto dto) {
		dao.updateContent(dto);
	}

	@Override
	public void delTag(HashMap<String, Integer> Map) {
		dao.delTag(Map);
	}


}
