package bit.com.inpho.dto;

import java.io.Serializable;

public class MyPagePostDto implements Serializable {

	private int post_seq;
	private int user_seq;
	private int camera_seq;
	private String post_content;
	private String post_wdate;
	private String post_filepath;
	private int post_readcount;
	private String post_position_name;
	
	private int count_like;
	private int count_book;
	
	private boolean dolike;
	private boolean dobookmark;
	
	public MyPagePostDto() {
		
	}

	public MyPagePostDto(int post_seq, int user_seq, int camera_seq, String post_content, String post_wdate,
			String post_filepath, int post_readcount, String post_position_name, int count_like, int count_book, boolean dolike, boolean dobookmark) {
		super();
		this.post_seq = post_seq;
		this.user_seq = user_seq;
		this.camera_seq = camera_seq;
		this.post_content = post_content;
		this.post_wdate = post_wdate;
		this.post_filepath = post_filepath;
		this.post_readcount = post_readcount;
		this.post_position_name = post_position_name;
		this.count_like = count_like;
		this.count_book = count_book;
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

	public int getCamera_seq() {
		return camera_seq;
	}

	public void setCamera_seq(int camera_seq) {
		this.camera_seq = camera_seq;
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

	public int getPost_readcount() {
		return post_readcount;
	}

	public void setPost_readcount(int post_readcount) {
		this.post_readcount = post_readcount;
	}

	public String getPost_position_name() {
		return post_position_name;
	}

	public void setPost_position_name(String post_position_name) {
		this.post_position_name = post_position_name;
	}

	public int getCount_like() {
		return count_like;
	}

	public void setCount_like(int count_like) {
		this.count_like = count_like;
	}

	public boolean isDolike() {
		return dolike;
	}

	public void setDolike(boolean dolike) {
		this.dolike = dolike;
	}

	public boolean isDobookmark() {
		return dobookmark;
	}

	public void setDobookmark(boolean dobookmark) {
		this.dobookmark = dobookmark;
	}

	public int getCount_book() {
		return count_book;
	}

	public void setCount_book(int count_book) {
		this.count_book = count_book;
	}

	@Override
	public String toString() {
		return "MyPagePostDto [post_seq=" + post_seq + ", user_seq=" + user_seq + ", camera_seq=" + camera_seq
				+ ", post_content=" + post_content + ", post_wdate=" + post_wdate + ", post_filepath=" + post_filepath
				+ ", post_readcount=" + post_readcount + ", post_position_name=" + post_position_name + ", count_like="
				+ count_like + ", count_book=" + count_book + ", dolike=" + dolike + ", dobookmark=" + dobookmark + "]";
	}
	
	


	
	
	
}

	