package bit.com.inpho.dto;

public class PostHashTagInfoDto {
	private int tag_seq;
	private String hashtag;
	
	public PostHashTagInfoDto() {
		
	}
	public PostHashTagInfoDto(int tag_seq, String hashtag) {
		super();
		this.tag_seq = tag_seq;
		this.hashtag = hashtag;
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
	@Override
	public String toString() {
		return "PostHashTagInfoDto [tag_seq=" + tag_seq + ", hashtag=" + hashtag + "]";
	}
	
}
