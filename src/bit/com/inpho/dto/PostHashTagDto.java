package bit.com.inpho.dto;

public class PostHashTagDto {
	private	String post_seq;
	private String tag_seq;
	
	public PostHashTagDto() {
		
	}
	
	public PostHashTagDto(String post_seq, String tag_seq) {
		super();
		this.post_seq = post_seq;
		this.tag_seq = tag_seq;
	}

	public String getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(String post_seq) {
		this.post_seq = post_seq;
	}
	public String getTag_seq() {
		return tag_seq;
	}
	public void setTag_seq(String tag_seq) {
		this.tag_seq = tag_seq;
	}
	
	@Override
	public String toString() {
		return "PostHashTagDto [post_seq=" + post_seq + ", tag_seq=" + tag_seq + "]";
	}
	
}
