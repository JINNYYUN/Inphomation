package bit.com.inpho.dao;

import java.util.List;

import bit.com.inpho.dto.LocationDTO;
import bit.com.inpho.dto.MapDetailDTO;
import bit.com.inpho.dto.MapInfoDTO;


public interface MapDao {
	
	List<LocationDTO> getMapLocation();
	
	List<MapDetailDTO> getMapInfo(MapInfoDTO mapInfoDTO);
	
	LocationDTO getPostLocation(int post_seq);
}
