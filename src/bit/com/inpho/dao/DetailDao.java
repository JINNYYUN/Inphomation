package bit.com.inpho.dao;

import java.util.List;

import bit.com.inpho.dto.DetailCountAllDto;
import bit.com.inpho.dto.DetailPostDto;
import bit.com.inpho.dto.DetailReplyDto;

public interface DetailDao {

	DetailPostDto getPost(int post_seq);
	List<DetailPostDto> getHashTag(int post_seq);
	void deleteDetail(int post_seq);
	List<DetailPostDto> getAllPost(DetailPostDto dto);
	
	boolean addBookmark(DetailCountAllDto dto);
	int countBookmark(DetailCountAllDto dto);
	boolean deleteBookmark(DetailCountAllDto dto);
	
	
	boolean addLike(DetailCountAllDto dto);
	int countLike(DetailCountAllDto dto);
	boolean deleteLike(DetailCountAllDto dto);
	int countLikeAll(int post_seq);
	List<DetailReplyDto> likeList(int post_seq);
	
	
	boolean addReply(DetailReplyDto dto);
	List<DetailReplyDto> replyList(int post_seq);
	boolean deleteReply(DetailReplyDto dto);
	
	void updateContent (DetailPostDto dto);
	void delTag (int post_seq);
}
