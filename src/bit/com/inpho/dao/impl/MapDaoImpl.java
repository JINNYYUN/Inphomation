package bit.com.inpho.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.MapDao;
import bit.com.inpho.dto.LocationDTO;
import bit.com.inpho.dto.MapDetailDTO;
import bit.com.inpho.dto.MapInfoDTO;

@Repository
public class MapDaoImpl implements MapDao {
	
	@Autowired		// DI
	SqlSession sqlSession;
	
	String ns = "mapMapper.";

	@Override
	public List<LocationDTO> getMapLocation() {
		
		return sqlSession.selectList(ns + "getMapLocation");
	}

	@Override
	public List<MapDetailDTO> getMapInfo(MapInfoDTO mapInfoDTO) {
		/*
		System.out.println("mapInfoDTO의 getInfoEast : " + mapInfoDTO.getInfoEast());
		System.out.println("mapInfoDTO의 getInfoNorth : " + mapInfoDTO.getInfoNorth());
		System.out.println("mapInfoDTO의 getInfoSouth : " + mapInfoDTO.getInfoSouth());
		System.out.println("mapInfoDTO의 getInfoWest  : " + mapInfoDTO.getInfoWest());
		*/
		
		return sqlSession.selectList(ns + "getMapInfo", mapInfoDTO);
	}

	@Override
	public LocationDTO getPostLocation(int post_seq) {

		return sqlSession.selectOne(ns + "getPostLocation", post_seq);
	}
}
