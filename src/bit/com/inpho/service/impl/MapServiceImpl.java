package bit.com.inpho.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.MapDao;
import bit.com.inpho.dto.LocationDTO;
import bit.com.inpho.dto.MapDetailDTO;
import bit.com.inpho.dto.MapInfoDTO;
import bit.com.inpho.dto.MyPagePostDto;
import bit.com.inpho.service.MapService;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	MapDao mapDao;

	@Override
	public List<LocationDTO> getMapLocation() {
		
		return mapDao.getMapLocation();
		
	}

	@Override
	public List<MapDetailDTO> getMapInfo(MapInfoDTO mapInfoDTO) {
		System.out.println("MapServiceImpl getMapInfo");
		
		return mapDao.getMapInfo(mapInfoDTO);
	}

	@Override
	public LocationDTO getPostLocation(int post_seq) {
		return mapDao.getPostLocation(post_seq);
	}

	@Override
	public List<MyPagePostDto> getDetailMapPost(LocationDTO locationInfo) {
		
		return mapDao.getDetailMapPost(locationInfo);
	}
}
