package bit.com.inpho.dto;

public class searchDto {
	private int userSeq;
	private String keywordId;
	public searchDto() {
		// TODO Auto-generated constructor stub
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getKeywordId() {
		return keywordId;
	}
	public void setKeywordId(String keywordId) {
		this.keywordId = keywordId;
	}
	@Override
	public String toString() {
		return "searchDto [userSeq=" + userSeq + ", keywordId=" + keywordId + "]";
	}
	
}
