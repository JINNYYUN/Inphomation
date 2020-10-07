package bit.com.inpho.dto;

import java.io.Serializable;

public class MyPageCameraParam implements Serializable {

	private int user_seq;
	private int camera_seq;
	
	public MyPageCameraParam() {
		
	}
	
	public MyPageCameraParam(int user_seq, int camera_seq) {
		super();
		this.user_seq = user_seq;
		this.camera_seq = camera_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public int getCamera_seq() {
		return camera_seq;
	}
	public void setCamera_seq(int camera_seq) {
		this.camera_seq = camera_seq;
	}
	@Override
	public String toString() {
		return "MyPageCameraParam [user_seq=" + user_seq + ", camera_seq=" + camera_seq + "]";
	}
	
	
	
}
