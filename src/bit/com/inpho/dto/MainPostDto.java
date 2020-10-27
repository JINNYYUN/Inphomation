package bit.com.inpho.dto;

import java.io.Serializable;
import java.util.List;


public class MainPostDto implements Serializable{
	private int postSeq;
	private int userSeq;
	private int postLike;
	private int postBookmark;
	private int postReply;
	private int userLike;
	private int userBookMark;
	private String userNickName;
	private String wdate;
	private String filePath;
	private String cameraSerial;
	private String positionName;
	private String postUserProfile;
	private String postContent;
	private List<String> hashtag;
	private List<DetailReplyDto> replyList;
	public MainPostDto() {}

	public int getPostSeq() {
		return postSeq;
	}

	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public int getPostLike() {
		return postLike;
	}

	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}

	public int getPostBookmark() {
		return postBookmark;
	}

	public void setPostBookmark(int postBookmark) {
		this.postBookmark = postBookmark;
	}

	public int getPostReply() {
		return postReply;
	}

	public void setPostReply(int postReply) {
		this.postReply = postReply;
	}

	public int getUserLike() {
		return userLike;
	}

	public void setUserLike(int userLike) {
		this.userLike = userLike;
	}

	public int getUserBookMark() {
		return userBookMark;
	}

	public void setUserBookMark(int userBookMark) {
		this.userBookMark = userBookMark;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getCameraSerial() {
		return cameraSerial;
	}

	public void setCameraSerial(String cameraSerial) {
		this.cameraSerial = cameraSerial;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public List<String> getHashtag() {
		return hashtag;
	}

	public void setHashtag(List<String> hashtag) {
		this.hashtag = hashtag;
	}

	public List<DetailReplyDto> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<DetailReplyDto> replyList) {
		this.replyList = replyList;
	}

	public String getPostUserProfile() {
		return postUserProfile;
	}

	public void setPostUserProfile(String postUserProfile) {
		this.postUserProfile = postUserProfile;
	}

	@Override
	public String toString() {
		return "MainPostDto [postSeq=" + postSeq + ", userSeq=" + userSeq + ", postLike=" + postLike + ", postBookmark="
				+ postBookmark + ", postReply=" + postReply + ", userLike=" + userLike + ", userBookMark="
				+ userBookMark + ", userNickName=" + userNickName + ", wdate=" + wdate + ", filePath=" + filePath
				+ ", cameraSerial=" + cameraSerial + ", positionName=" + positionName + ", postUserProfile="
				+ postUserProfile + ", hashtag=" + hashtag + ", replyList=" + replyList + "]";
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	
	
}
