package bit.com.inpho.dto;

import java.io.Serializable;

public class DetailReplyDto implements Serializable {

	private int post_seq;
	private int user_seq;
	private String reply_content;
	private String reply_date;
	private int reply_seq;
	
	private String user_nickname;
	private String profile_image;
	
	public DetailReplyDto() {}

	

	public DetailReplyDto(int post_seq, int user_seq, int reply_seq, String profile_image) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.reply_seq = reply_seq;
		this.profile_image = profile_image;
	}



	public DetailReplyDto(int post_seq, int user_seq, String reply_content, String reply_date, int reply_seq, String profile_image) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.reply_seq = reply_seq;
		this.profile_image = profile_image;
	}



	public DetailReplyDto(int post_seq, int user_seq, String reply_content, String reply_date, int reply_seq,
			String user_nickname, String profile_image) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.user_nickname = user_nickname;
		this.reply_seq = reply_seq;
		this.profile_image = profile_image;
	}




	public String getProfile_image() {
		return profile_image;
	}



	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
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



	public String getReply_date() {
		return reply_date;
	}



	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}



	public int getReply_seq() {
		return reply_seq;
	}



	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}



	public String getUser_nickname() {
		return user_nickname;
	}



	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}



	@Override
	public String toString() {
		return "DetailReplyDto [post_seq=" + post_seq + ", user_seq=" + user_seq + ", reply_content=" + reply_content
				+ ", reply_date=" + reply_date + ", user_nickname=" + user_nickname + "]";
	}
	
	
	
}
