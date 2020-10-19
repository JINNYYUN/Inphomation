package bit.com.inpho.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.inpho.dto.LocationDTO;
import bit.com.inpho.dto.MapDetailDTO;
import bit.com.inpho.dto.MapInfoDTO;
import bit.com.inpho.service.MapService;

@Controller
public class MapController {
	
	@Autowired
	MapService mapService;
	
	/**
	 * 지도 서비스 접속
	 * @return
	 */
	@RequestMapping(value = "map", method = RequestMethod.GET)
	public String showMap() {
		System.out.println("MapController showMap()");		
		return "map.tiles";
	}
	
	/**
	 * 지도에 뿌릴 위치 데이터 가져오기
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "getMapLocation", method = RequestMethod.POST)
	public List<LocationDTO> getMapLocation() {
		System.out.println("MapController getMapLocation()");
		
		return mapService.getMapLocation();
	}
	
	
	/**
	 * 지도 경도, 위도 안에 있는 데이터 가져오기
	 * @param mapInfo, 지도 위치 문자 정보 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "getMapInfo", method = RequestMethod.POST)
	public List<MapDetailDTO> getMapInfo(String mapInfo, String sortingOption) {
		System.out.println("MapController getMapInfo()");
		System.out.println(mapInfo);
		
		//문자열 정리
		String str = mapInfo.replace(" ","");
		String str2 = str.replace("(","");
		String infoString = str2.replace(")","");
		
		//문자열에서 데이터 추출하기
		String infoArray[] = infoString.split(",");
		
		String infoSouth = infoArray[0]; //남쪽 위도 좌표
		String infoWest = infoArray[1];	//서쪽 경도 좌표
		String infoNorth = infoArray[2]; //북쪽 위도 좌표
		String infoEast = infoArray[3]; //동쪽 경도 좌표
		
		System.out.println(infoSouth+"+"+infoWest+"+"+infoNorth+"+"+infoEast);
		
		MapInfoDTO mapInfoDTO = new MapInfoDTO(infoSouth, infoWest, infoNorth, infoEast, sortingOption);
		
		List<MapDetailDTO> info = mapService.getMapInfo(mapInfoDTO);
		
		for(MapDetailDTO i : info){
		    System.out.println(i.toString());
		}
		
		return info;
	}
	
	/**
	 * 지도로 보는 디테일 페이지 접속
	 * @return
	 */
	@RequestMapping(value = "detail/map", method = RequestMethod.GET)
	public String showDetailMap(Model model, int post_seq) {
		System.out.println("MapController showDetailMap()");
		
		LocationDTO locationInfo = mapService.getPostLocation(post_seq);
		
		System.out.println(locationInfo.toString());
		model.addAttribute("postLocationInfo", locationInfo);
		
		return "detailMap.tiles";
	}
}
