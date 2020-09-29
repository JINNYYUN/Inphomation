package bit.com.inpho.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.inpho.dto.DetailBookmarkDto;
import bit.com.inpho.service.DetailService;

@Controller
public class DetailController {
	
	@Autowired
	DetailService service;
	
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
	public String detail() {
		return "detail.tiles";
	}
	@ResponseBody
	@RequestMapping(value = "addBookmark.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addBookmark(DetailBookmarkDto dto, Model model) throws Exception {
	
		boolean b = service.addBookmark(dto);
		System.out.println(b);
		
		String msg = "";
		if (b) {
			msg = "NO";
			return msg;
		}else {
			msg = "YES";
			return msg;
		}
	}
	
	@RequestMapping(value = "deleteBookmark.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteBookmark(DetailBookmarkDto dto) throws Exception {
		return null;
	}
	
	@RequestMapping(value = "addLike.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addLike () throws Exception {
		return null;
		
	}
	
	
}
