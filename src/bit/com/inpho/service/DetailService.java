package bit.com.inpho.service;

import bit.com.inpho.dto.DetailBookmarkDto;
import bit.com.inpho.dto.DetailLikeDto;
import bit.com.inpho.dto.DetailReplyDto;

public interface DetailService {

	boolean addBookmark(DetailBookmarkDto dto);
	int countBookmark(DetailBookmarkDto dto);
	boolean deleteBookmark(DetailBookmarkDto dto);
	
	boolean addLike(DetailLikeDto dto);
	int countLike(DetailLikeDto dto);
	boolean deleteLike(DetailLikeDto dto);
	int countLikeAll(int post_seq);
	
	boolean addReply(DetailReplyDto dto);

}
