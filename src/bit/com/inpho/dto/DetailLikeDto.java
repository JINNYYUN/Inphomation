package bit.com.inpho.dto;

import java.io.Serializable;

public class DetailLikeDto implements Serializable {

	private int post_seq;
	private int user_seq;
	private String like_wdate;
	
	public DetailLikeDto() {}

	public DetailLikeDto(int post_seq, int user_seq, String like_wdate) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.like_wdate = like_wdate;
	}

	public DetailLikeDto(int post_seq, int user_seq) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
	}

	public int getPost_seq() {
		return post_seq;
	}

	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getLike_wdate() {
		return like_wdate;
	}

	public void setLike_wdate(String like_wdate) {
		this.like_wdate = like_wdate;
	}
	
	
}
