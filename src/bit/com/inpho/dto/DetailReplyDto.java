package bit.com.inpho.dto;

import java.io.Serializable;

public class DetailReplyDto implements Serializable {

	private int post_seq;
	private int user_seq;
	private String reply_content;
	private String reply_date;
	
	private String user_nickname;
	
	public DetailReplyDto() {}

	public DetailReplyDto(int post_seq, int user_seq, String reply_content, String reply_date) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
	}

	public DetailReplyDto(int post_seq, int user_seq, String reply_content, String reply_date, String user_nickname) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.user_nickname = user_nickname;
	}

	public DetailReplyDto(String reply_content, String reply_date, String user_nickname) {
		super();
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.user_nickname = user_nickname;
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

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getreply_date() {
		return reply_date;
	}

	public void setreply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	public String getuser_nickname() {
		return user_nickname;
	}

	public void setuser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	@Override
	public String toString() {
		return "DetailReplyDto [post_seq=" + post_seq + ", user_seq=" + user_seq + ", reply_content=" + reply_content
				+ ", reply_date=" + reply_date + ", user_nickname=" + user_nickname + "]";
	}
	
	
	
}
