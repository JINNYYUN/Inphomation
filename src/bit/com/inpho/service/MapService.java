package bit.com.inpho.service;

import java.util.List;

import bit.com.inpho.dto.LocationDTO;
import bit.com.inpho.dto.MapDetailDTO;
import bit.com.inpho.dto.MapInfoDTO;

public interface MapService {

	List<LocationDTO> getMapLocation();
	
	List<MapDetailDTO> getMapInfo(MapInfoDTO mapInfoDTO);
	
	LocationDTO getPostLocation(int post_seq);
}
