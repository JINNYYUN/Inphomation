package bit.com.inpho.dto;

import java.io.Serializable;

public class DetailPostDto implements Serializable {

	private int post_seq;
	private int user_seq;
	private String post_content;
	private String post_wdate;
	private String post_filepath;
	private String post_position_name;
	private int del;
	
	private int tag_seq;
	private String hashtag;
	
	private String camera_serial;
	
	public DetailPostDto() {}

	public DetailPostDto(int post_seq, int user_seq, String post_content, String post_wdate, String post_filepath,
			String post_position_name, int tag_seq, String hashtag, String camera_serial, int del) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.post_content = post_content;
		this.post_wdate = post_wdate;
		this.post_filepath = post_filepath;
		this.post_position_name = post_position_name;
		this.tag_seq = tag_seq;
		this.hashtag = hashtag;
		this.camera_serial = camera_serial;
		this.del = del;
	}

	
	
	public DetailPostDto(int post_seq, int user_seq, String post_filepath, String camera_serial) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.post_filepath = post_filepath;
		this.camera_serial = camera_serial;
	}
	
	public DetailPostDto(int post_seq, String camera_serial) {
		super();
		this.post_seq = post_seq;
		this.camera_serial = camera_serial;
	}
	
	

	public DetailPostDto(int post_seq, int user_seq) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
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

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public String getPost_wdate() {
		return post_wdate;
	}

	public void setPost_wdate(String post_wdate) {
		this.post_wdate = post_wdate;
	}

	public String getPost_filepath() {
		return post_filepath;
	}

	public void setPost_filepath(String post_filepath) {
		this.post_filepath = post_filepath;
	}

	public String getPost_position_name() {
		return post_position_name;
	}

	public void setPost_position_name(String post_position_name) {
		this.post_position_name = post_position_name;
	}

	public int getTag_seq() {
		return tag_seq;
	}

	public void setTag_seq(int tag_seq) {
		this.tag_seq = tag_seq;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getCamera_serial() {
		return camera_serial;
	}

	public void setCamera_serial(String camera_serial) {
		this.camera_serial = camera_serial;
	}

	@Override
	public String toString() {
		return "DetailPostDto [post_seq=" + post_seq + ", user_seq=" + user_seq + ", post_content=" + post_content
				+ ", post_wdate=" + post_wdate + ", post_filepath=" + post_filepath + ", post_position_name="
				+ post_position_name + ", tag_seq=" + tag_seq + ", hashtag=" + hashtag + ", camera_serial="
				+ camera_serial + "]";
	}
	
	
}
