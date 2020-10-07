package bit.com.inpho.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.DetailDao;
import bit.com.inpho.dto.DetailBookmarkDto;
import bit.com.inpho.dto.DetailLikeDto;
import bit.com.inpho.dto.DetailReplyDto;
import bit.com.inpho.service.DetailService;
@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	DetailDao dao;
	
	@Override
	public boolean addBookmark(DetailBookmarkDto dto) {
		return dao.addBookmark(dto);
	}

	@Override
	public int countBookmark(DetailBookmarkDto dto) {
		return dao.countBookmark(dto);
	}

	@Override
	public boolean deleteBookmark(DetailBookmarkDto dto) {
		return dao.deleteBookmark(dto);
	}

	@Override
	public boolean addLike(DetailLikeDto dto) {
		return dao.addLike(dto);
	}

	@Override
	public int countLike(DetailLikeDto dto) {
		return dao.countLike(dto);
	}

	@Override
	public boolean deleteLike(DetailLikeDto dto) {
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


}
