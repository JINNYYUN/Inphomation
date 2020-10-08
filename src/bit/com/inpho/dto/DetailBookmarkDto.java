package bit.com.inpho.dto;

import java.io.Serializable;

public class DetailBookmarkDto implements Serializable {

	private int post_seq;
	private int user_seq;
	
	public DetailBookmarkDto() {}

	public DetailBookmarkDto(int post_seq, int user_seq) {
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

	@Override
	public String toString() {
		return "DetailBookmarkDto [post_seq=" + post_seq + ", user_seq=" + user_seq + "]";
	}



	
}
