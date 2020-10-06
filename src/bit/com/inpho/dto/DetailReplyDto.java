package bit.com.inpho.dto;

import java.io.Serializable;

public class DetailReplyDto implements Serializable {

	private int post_seq;
	private int user_seq;
	private String reply_content;
	private String date;
	
	private String nickname;
	
	public DetailReplyDto() {}

	public DetailReplyDto(int post_seq, int user_seq, String reply_content, String date) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.reply_content = reply_content;
		this.date = date;
	}

	public DetailReplyDto(int post_seq, int user_seq, String reply_content, String date, String nickname) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.reply_content = reply_content;
		this.date = date;
		this.nickname = nickname;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "DetailReplyDto [post_seq=" + post_seq + ", user_seq=" + user_seq + ", reply_content=" + reply_content
				+ ", date=" + date + ", nickname=" + nickname + "]";
	}
	
	
	
}
