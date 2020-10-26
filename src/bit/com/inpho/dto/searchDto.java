package bit.com.inpho.dto;

public class searchDto {
	private int userSeq;
	private String keywordId;
	private int moreFeedNum;
	private int startNum;
	private int endNum;
	public searchDto() {}
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
	public int getMoreFeedNum() {
		return moreFeedNum;
	}
	public void setMoreFeedNum(int moreFeedNum) {
		this.moreFeedNum = moreFeedNum;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = (startNum*30)+1;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = (endNum+1)*30;
	}
	@Override
	public String toString() {
		return "searchDto [userSeq=" + userSeq + ", keywordId=" + keywordId + ", moreFeedNum=" + moreFeedNum
				+ ", startNum=" + startNum + ", endNum=" + endNum + "]";
	}
	
	
}
