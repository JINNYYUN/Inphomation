package bit.com.inpho.dao;

import java.util.List;

import bit.com.inpho.dto.LocationDTO;


public interface MapDao {
	
	List<LocationDTO> getMapLocation();
	
}
