package bit.com.inpho.dto;



public class PostDto  {

	private int post_seq;
	private int camera_seq;
	private int user_seq;
	private String content;
	private String wdate;// sysdate
	private String filepath;
	private int readcount;
	private String location;
	private String hashtag;
	private int del;
	private String camera;
	
	public PostDto() {
		
	}
	public PostDto(int post_seq, int camera_seq, int user_seq, String content, String wdate, String filepath,
			int readcount, String location, String hashtag, int del, String camera) {
		super();
		this.post_seq = post_seq;
		this.camera_seq = camera_seq;
		this.user_seq = user_seq;
		this.content = content;
		this.wdate = wdate;
		this.filepath = filepath;
		this.readcount = readcount;
		this.location = location;
		this.hashtag = hashtag;
		this.del = del;
		this.camera = camera;
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
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getCamera() {
		return camera;
	}
	public void setCamera(String camera) {
		this.camera = camera;
	}
	
	@Override
	public String toString() {
		return "PostDto [post_seq=" + post_seq + ", camera_seq=" + camera_seq + ", user_seq=" + user_seq + ", content="
				+ content + ", wdate=" + wdate + ", filepath=" + filepath + ", readcount=" + readcount + ", location="
				+ location + ", hashtag=" + hashtag + ", del=" + del + ", camera=" + camera + "]";
	}

	
	
}
