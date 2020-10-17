package bit.com.inpho.dto;

import java.util.Arrays;


public class PostDto {

	private int post_seq;
	private int camera_seq;
	private int user_seq;
	private int readcount;
	private int del;
	private String content;
	private String wdate;
	private String filepath;
	private String location;
	private String camera;
	private String[] hashtag;
	private String place;

	public PostDto() {

	}

	public PostDto(int post_seq, int camera_seq, int user_seq, int readcount, int del, String content, String wdate,
			String filepath, String location, String camera, String[] hashtag, String place) {
		super();
		this.post_seq = post_seq;
		this.camera_seq = camera_seq;
		this.user_seq = user_seq;
		this.readcount = readcount;
		this.del = del;
		this.content = content;
		this.wdate = wdate;
		this.filepath = filepath;
		this.location = location;
		this.camera = camera;
		this.hashtag = hashtag;
		this.place = place;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCamera() {
		return camera;
	}

	public void setCamera(String camera) {
		this.camera = camera;
	}

	public String[] getHashtag() {
		return hashtag;
	}

	public void setHashtag(String[] hashtag) {
		this.hashtag = hashtag;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	@Override
	public String toString() {
		return "PostDto [post_seq=" + post_seq + ", camera_seq=" + camera_seq + ", user_seq=" + user_seq
				+ ", readcount=" + readcount + ", del=" + del + ", content=" + content + ", wdate=" + wdate
				+ ", filepath=" + filepath + ", location=" + location + ", camera=" + camera + ", hashtag="
				+ Arrays.toString(hashtag) + ", place=" + place + "]";
	}


}
