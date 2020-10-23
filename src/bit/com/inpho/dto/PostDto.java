package bit.com.inpho.dto;


public class PostDto {
	private int post_seq;
	private int camera_seq;
	private int user_seq;
	private int tag_seq;
	private int readcount;
	private int del;
	private String content;
	private String wdate;
	private String filepath;
	private String location;
	private String camera_serial;
	private String hashtag;
	public PostDto() {
		// TODO Auto-generated constructor stub
	}
	public PostDto(int post_seq, int camera_seq, int user_seq, int tag_seq, int readcount, int del, String content,
			String wdate, String filepath, String location, String camera_serial, String hashtag) {
		super();
		this.post_seq = post_seq;
		this.camera_seq = camera_seq;
		this.user_seq = user_seq;
		this.tag_seq = tag_seq;
		this.readcount = readcount;
		this.del = del;
		this.content = content;
		this.wdate = wdate;
		this.filepath = filepath;
		this.location = location;
		this.camera_serial = camera_serial;
		this.hashtag = hashtag;
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
	public int getTag_seq() {
		return tag_seq;
	}
	public void setTag_seq(int tag_seq) {
		this.tag_seq = tag_seq;
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
	public String getCamera_serial() {
		return camera_serial;
	}
	public void setCamera_serial(String camera_serial) {
		this.camera_serial = camera_serial;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	@Override
	public String toString() {
		return "PostDto [post_seq=" + post_seq + ", camera_seq=" + camera_seq + ", user_seq=" + user_seq + ", tag_seq="
				+ tag_seq + ", readcount=" + readcount + ", del=" + del + ", content=" + content + ", wdate=" + wdate
				+ ", filepath=" + filepath + ", location=" + location + ", camera_serial=" + camera_serial
				+ ", hashtag=" + hashtag + "]";
	}
	
	}
