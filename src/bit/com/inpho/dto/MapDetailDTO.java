package bit.com.inpho.dto;

public class MapDetailDTO {
	private int post_seq;
	private String user_nickname;
	private String post_content;
	private String post_filepath;
	private String post_position_name;
	
	public MapDetailDTO() {
		
	}
	
	public MapDetailDTO(int post_seq, String user_nickname, String post_content, String post_filepath,
			String post_position_name) {
		super();
		this.post_seq = post_seq;
		this.user_nickname = user_nickname;
		this.post_content = post_content;
		this.post_filepath = post_filepath;
		this.post_position_name = post_position_name;
	}

	public int getPost_seq() {
		return post_seq;
	}

	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
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

	@Override
	public String toString() {
		return "MapDetailDTO [post_seq=" + post_seq + ", user_nickname=" + user_nickname + ", post_content="
				+ post_content + ", post_filepath=" + post_filepath + ", post_position_name=" + post_position_name
				+ "]";
	}
}
