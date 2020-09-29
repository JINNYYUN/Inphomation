package bit.com.inpho.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.inpho.dto.BookmarkDto;
import bit.com.inpho.service.DetailService;

@Controller
public class DetailController {
	
	@Autowired
	DetailService service;
	
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
	public String detail() {
		return "detail.tiles";
	}
	
	@RequestMapping(value = "addBookmark.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addBookmark(BookmarkDto dto) throws Exception {
		if(dto.getPost_id().equals("") || dto.getUser_id().equals("")) {
			return "NO";
		}else {
			return "YES";
		}
	}
	
}
