package bit.com.inpho.dto;

import java.io.Serializable;

public class DetailBookmarkDto implements Serializable {

	private String post_seq;
	private String user_seq;
	
	public DetailBookmarkDto() {}

	public DetailBookmarkDto(String post_seq, String user_seq) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
	}

	public String getPost_seq() {
		return post_seq;
	}

	public void setPost_seq(String post_seq) {
		this.post_seq = post_seq;
	}

	public String getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}



	
}
