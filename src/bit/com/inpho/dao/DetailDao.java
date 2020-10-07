package bit.com.inpho.dao;

import java.util.List;

import bit.com.inpho.dto.DetailBookmarkDto;
import bit.com.inpho.dto.DetailLikeDto;
import bit.com.inpho.dto.DetailReplyDto;

public interface DetailDao {

	boolean addBookmark(DetailBookmarkDto dto);
	int countBookmark(DetailBookmarkDto dto);
	boolean deleteBookmark(DetailBookmarkDto dto);
	
	boolean addLike(DetailLikeDto dto);
	int countLike(DetailLikeDto dto);
	boolean deleteLike(DetailLikeDto dto);
	int countLikeAll(int post_seq);
	
	boolean addReply(DetailReplyDto dto);
	List<DetailReplyDto> replyList(int post_seq);
}
