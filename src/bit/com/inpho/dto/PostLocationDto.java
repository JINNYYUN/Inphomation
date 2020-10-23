package bit.com.inpho.dto;

public class PostLocationDto {
	private int post_seq;
	private String post_latitude;
	private String post_longitude;
	public PostLocationDto() {
		
	}
	
	public int getPost_seq() {
		return post_seq;
	}

	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public String getPost_latitude() {
		return post_latitude;
	}

	public void setPost_latitude(String post_latitude) {
		this.post_latitude = post_latitude;
	}

	public String getPost_longitude() {
		return post_longitude;
	}

	public void setPost_longitude(String post_longitude) {
		this.post_longitude = post_longitude;
	}

	public PostLocationDto(int post_seq, String post_latitude, String post_longitude) {
		super();
		this.post_seq = post_seq;
		this.post_latitude = post_latitude;
		this.post_longitude = post_longitude;
	}

	@Override
	public String toString() {
		return "PostLocationDto [post_seq=" + post_seq + ", post_latitude=" + post_latitude + ", post_longitude="
				+ post_longitude + "]";
	}
}
