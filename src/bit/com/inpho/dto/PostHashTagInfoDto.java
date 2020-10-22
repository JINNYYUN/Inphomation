package bit.com.inpho.dto;



public class PostHashTagInfoDto {
	private String tag_seq;
	private String post_seq;
	
	public PostHashTagInfoDto() {
		
	}

	public PostHashTagInfoDto(String tag_seq, String post_seq) {
		super();
		this.tag_seq = tag_seq;
		this.post_seq = post_seq;
	}

	public String getTag_seq() {
		return tag_seq;
	}

	public void setTag_seq(String tag_seq) {
		this.tag_seq = tag_seq;
	}

	public String getPost_seq() {
		return post_seq;
	}

	public void setPost_seq(String post_seq) {
		this.post_seq = post_seq;
	}

	@Override
	public String toString() {
		return "PostHashTagInfoDto [tag_seq=" + tag_seq + ", post_seq=" + post_seq + "]";
	}


	
	
}
