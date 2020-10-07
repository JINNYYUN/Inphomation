package bit.com.inpho.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.inpho.dto.LocationDTO;
import bit.com.inpho.service.MapService;

@Controller
public class MapController {
	
	@Autowired
	MapService mapService;
	
	@RequestMapping(value = "map", method = RequestMethod.GET)
	public String showMap() {
		System.out.println("MapController showMap()");		
		return "map.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "getMapLocation", method = RequestMethod.GET)
	public List<LocationDTO> getMapLocation() {
		System.out.println("MapController getMapLocation()");
		
		return mapService.getMapLocation();
	}
}
