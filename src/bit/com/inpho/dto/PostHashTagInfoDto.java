package bit.com.inpho.dto;

import java.util.List;

public class PostHashTagInfoDto {
	private int tag_seq;
	private List<String> hashtag;
	
	
	public PostHashTagInfoDto() {
		
	}


	public PostHashTagInfoDto(int tag_seq, List<String> hashtag) {
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


	public List<String> getHashtag() {
		return hashtag;
	}


	public void setHashtag(List<String> hashtag) {
		this.hashtag = hashtag;
	}


	@Override
	public String toString() {
		return "PostHashTagInfoDto [tag_seq=" + tag_seq + ", hashtag=" + hashtag + "]";
	}
	
}
