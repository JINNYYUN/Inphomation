package bit.com.inpho.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.MapDao;
import bit.com.inpho.dto.LocationDTO;
import bit.com.inpho.dto.MapDetailDTO;
import bit.com.inpho.dto.MapInfoDTO;
import bit.com.inpho.service.MapService;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	MapDao mapDao;

	@Override
	public List<LocationDTO> getMapLocation() {
		// TODO Auto-generated method stub
		return mapDao.getMapLocation();
	}

	@Override
	public List<MapDetailDTO> getMapInfo(MapInfoDTO mapInfoDTO) {
		System.out.println("MapServiceImpl getMapInfo");
		
		// TODO Auto-generated method stub
		return mapDao.getMapInfo(mapInfoDTO);
	}
}
