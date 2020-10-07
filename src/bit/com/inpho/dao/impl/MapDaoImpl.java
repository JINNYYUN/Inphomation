package bit.com.inpho.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.MapDao;
import bit.com.inpho.dto.LocationDTO;

@Repository
public class MapDaoImpl implements MapDao {
	
	@Autowired		// DI
	SqlSession sqlSession;
	
	String ns = "mapMapper.";

	@Override
	public List<LocationDTO> getMapLocation() {
		
		return sqlSession.selectList(ns + "getMapLocation");
	}
}
