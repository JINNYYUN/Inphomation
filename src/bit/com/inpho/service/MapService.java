package bit.com.inpho.service;

import java.util.List;

import bit.com.inpho.dto.DetailPostDto;
import bit.com.inpho.dto.LocationDTO;
import bit.com.inpho.dto.MapInfoDTO;

public interface MapService {

	List<LocationDTO> getMapLocation();
	
	List<DetailPostDto> getMapInfo(MapInfoDTO mapInfoDTO);
}
