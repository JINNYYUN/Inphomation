package bit.com.inpho.dto;

import java.io.Serializable;

public class MyPageCameraDto implements Serializable {

	private int camera_seq;
	private String camera_serial;
	private String camera_image;
	
	public MyPageCameraDto() {
	}

	public MyPageCameraDto(int camera_seq, String camera_serial, String camera_image) {
		super();
		this.camera_seq = camera_seq;
		this.camera_serial = camera_serial;
		this.camera_image = camera_image;
	}

	public int getCamera_seq() {
		return camera_seq;
	}

	public void setCamera_seq(int camera_seq) {
		this.camera_seq = camera_seq;
	}

	public String getCamera_serial() {
		return camera_serial;
	}

	public void setCamera_serial(String camera_serial) {
		this.camera_serial = camera_serial;
	}

	public String getCamera_image() {
		return camera_image;
	}

	public void setCamera_image(String camera_image) {
		this.camera_image = camera_image;
	}

	@Override
	public String toString() {
		return "MyPageCameraDto [camera_seq=" + camera_seq + ", camera_serial=" + camera_serial + ", camera_image="
				+ camera_image + "]";
	}
	
	
}
