package bit.com.inpho.dto;

public class LocationDTO {
	String latitude; //위도
	String longitude; //경도
	
	public LocationDTO() {
		
	}
	
	public LocationDTO(String latitude, String longitude) {
		this.latitude = latitude;
		this.longitude = longitude;
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
}
