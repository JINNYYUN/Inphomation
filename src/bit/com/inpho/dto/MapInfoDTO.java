package bit.com.inpho.dto;

public class MapInfoDTO {
	String infoSouth; //남쪽 위도 좌표
	String infoWest;	//서쪽 경도 좌표
	String infoNorth; //북쪽 위도 좌표
	String infoEast; //동쪽 경도 좌표
	String sortingOption; //페이지 정렬 방
	
	public MapInfoDTO(){
		
	}

	public MapInfoDTO(String infoSouth, String infoWest, String infoNorth, String infoEast, String sortingOption) {
		super();
		this.infoSouth = infoSouth;
		this.infoWest = infoWest;
		this.infoNorth = infoNorth;
		this.infoEast = infoEast;
		this.sortingOption = sortingOption;
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

	public String getSortingOption() {
		return sortingOption;
	}

	public void setSortingOption(String sortingOption) {
		this.sortingOption = sortingOption;
	}

	@Override
	public String toString() {
		return "MapInfoDTO [infoSouth=" + infoSouth + ", infoWest=" + infoWest + ", infoNorth=" + infoNorth
				+ ", infoEast=" + infoEast + ", sortingOption=" + sortingOption + "]";
	}
	
}