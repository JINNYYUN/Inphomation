package bit.com.inpho.dto;

public class MapInfoDTO {
	String infoNorth; //북쪽 위도 좌표
	String infoWest;	//서쪽 경도 좌표
	String infoSouth; //남쪽 위도 좌표
	String infoEast; //동쪽 경도 좌표
	
	public MapInfoDTO() {
		
	}
	
	public MapInfoDTO(String infoNorth, String infoWest, String infoSouth, String infoEast) {
		super();
		this.infoNorth = infoNorth;
		this.infoWest = infoWest;
		this.infoSouth = infoSouth;
		this.infoEast = infoEast;
	}

	public String getInfoNorth() {
		return infoNorth;
	}
	public void setInfoNorth(String infoNorth) {
		this.infoNorth = infoNorth;
	}
	public String getInfoWest() {
		return infoWest;
	}
	public void setInfoWest(String infoWest) {
		this.infoWest = infoWest;
	}
	public String getInfoSouth() {
		return infoSouth;
	}
	public void setInfoSouth(String infoSouth) {
		this.infoSouth = infoSouth;
	}
	public String getInfoEast() {
		return infoEast;
	}
	public void setInfoEast(String infoEast) {
		this.infoEast = infoEast;
	}
}
