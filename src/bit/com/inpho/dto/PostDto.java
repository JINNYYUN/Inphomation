package bit.com.inpho.dto;



public class PostDto  {

	private int post_seq;
	private int camera_seq;
	private int user_seq;
	private String post_content;
	private String post_wdate;
	private String post_filepath;
	private int post_readcount;
	private String post_position_name;
	private int del;
	public PostDto() {
		
	}
	
	public PostDto(int post_seq, int camera_seq, int user_seq, String post_content, String post_wdate,
			String post_filepath, int post_readcount, String post_position_name, int del) {
		super();
		this.post_seq = post_seq;
		this.camera_seq = camera_seq;
		this.user_seq = user_seq;
		this.post_content = post_content;
		this.post_wdate = post_wdate;
		this.post_filepath = post_filepath;
		this.post_readcount = post_readcount;
		this.post_position_name = post_position_name;
		this.del = del;
	}

	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	public int getCamera_seq() {
		return camera_seq;
	}
	public void setCamera_seq(int camera_seq) {
		this.camera_seq = camera_seq;
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
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	
}
