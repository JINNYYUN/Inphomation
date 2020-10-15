package bit.com.inpho.dto;

public class MapInfoDTO {
	String infoSouth; //남쪽 위도 좌표
	String infoWest;	//서쪽 경도 좌표
	String infoNorth; //북쪽 위도 좌표
	String infoEast; //동쪽 경도 좌표
	
	public MapInfoDTO(){
		
	}
	
	public MapInfoDTO(String infoSouth, String infoWest, String infoNorth, String infoEast) {
		super();
		this.infoSouth = infoSouth;
		this.infoWest = infoWest;
		this.infoNorth = infoNorth;
		this.infoEast = infoEast;
	}

	public String getInfoSouth() {
		return infoSouth;
	}

	public void setInfoSouth(String infoSouth) {
		this.infoSouth = infoSouth;
	}

	public String getInfoWest() {
		return infoWest;
	}

	public void setInfoWest(String infoWest) {
		this.infoWest = infoWest;
	}

	public String getInfoNorth() {
		return infoNorth;
	}

	public void setInfoNorth(String infoNorth) {
		this.infoNorth = infoNorth;
	}

	public String getInfoEast() {
		return infoEast;
	}

	public void setInfoEast(String infoEast) {
		this.infoEast = infoEast;
	}
	
	
}