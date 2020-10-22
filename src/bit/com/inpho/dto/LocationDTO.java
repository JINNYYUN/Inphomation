package bit.com.inpho.dto;

public class LocationDTO {
	String post_position_name;
	String latitude; //위도
	String longitude; //경도
	
	public LocationDTO() {
		
	}

	public LocationDTO(String post_position_name, String latitude, String longitude) {
		super();
		this.post_position_name = post_position_name;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public LocationDTO(String latitude, String longitude) {
		super();
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public String getPost_position_name() {
		return post_position_name;
	}

	public void setPost_position_name(String post_position_name) {
		this.post_position_name = post_position_name;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "LocationDTO [post_position_name=" + post_position_name + ", latitude=" + latitude + ", longitude="
				+ longitude + "]";
	}
}