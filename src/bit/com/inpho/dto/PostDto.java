package bit.com.inpho.dto;

import java.io.Serializable;

public class PostDto implements Serializable {

	private String post_seq;
	private String camera_seq;
	private String user_seq;
	private String post_content;
	private String post_wdate;
	private String post_filepath;
	private String post_readcount;
	private String post_position_name;
	public PostDto() {
		
	}
	
	public PostDto(String post_seq, String camera_seq, String user_seq, String post_content, String post_wdate,
			String post_filepath, String post_readcount, String post_position_name) {
		super();
		this.post_seq = post_seq;
		this.camera_seq = camera_seq;
		this.user_seq = user_seq;
		this.post_content = post_content;
		this.post_wdate = post_wdate;
		this.post_filepath = post_filepath;
		this.post_readcount = post_readcount;
		this.post_position_name = post_position_name;
	}

	public String getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(String post_seq) {
		this.post_seq = post_seq;
	}
	public String getCamera_seq() {
		return camera_seq;
	}
	public void setCamera_seq(String camera_seq) {
		this.camera_seq = camera_seq;
	}
	public String getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(String user_seq) {
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
	public String getPost_readcount() {
		return post_readcount;
	}
	public void setPost_readcount(String post_readcount) {
		this.post_readcount = post_readcount;
	}
	public String getPost_position_name() {
		return post_position_name;
	}
	public void setPost_position_name(String post_position_name) {
		this.post_position_name = post_position_name;
	}

	@Override
	public String toString() {
		return "PostDto [post_seq=" + post_seq + ", camera_seq=" + camera_seq + ", user_seq=" + user_seq
				+ ", post_content=" + post_content + ", post_wdate=" + post_wdate + ", post_filepath=" + post_filepath
				+ ", post_readcount=" + post_readcount + ", post_position_name=" + post_position_name + "]";
	}
	
}
