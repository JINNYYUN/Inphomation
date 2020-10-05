package bit.com.inpho.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.inpho.service.MapService;

@Controller
public class MapController {
	@Autowired
	MapService mapService;
	
	@RequestMapping(value = "map.do", method = RequestMethod.GET)
	public String showMap() {
		System.out.println("MapController showMap()");		
		return "map.tiles";
	}
}
