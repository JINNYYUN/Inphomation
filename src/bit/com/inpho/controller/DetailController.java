package bit.com.inpho.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.inpho.dto.DetailBookmarkDto;
import bit.com.inpho.dto.DetailLikeDto;
import bit.com.inpho.dto.DetailReplyDto;
import bit.com.inpho.service.DetailService;

@Controller
public class DetailController {
	
	@Autowired
	DetailService service;
	
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
	public String detail(/*int user_seq,*/ Model model) {
	//	DetailBookmarkDto dto = service.
		
		return "detail.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "addBookmark.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addBookmark(DetailBookmarkDto dto, Model model) throws Exception {
		/* bookmark 테이블에 해당 유저의 데이터가 몇 개 있는지 확인하기 위함*/
		int n = service.countBookmark(dto);
		System.out.println(n);
		
		model.addAttribute("count", n);
		
		String msg = "";
		if (n == 0) {
			boolean add = service.addBookmark(dto);
			System.out.println(add);
			msg = "NO";
		}else {
			boolean del = service.deleteBookmark(dto); 
			System.out.println("del: " + del);
			msg = "YES";
		}
		return msg;
	}
	
	/*
	 * @RequestMapping(value = "deleteBookmark.do", method = {RequestMethod.GET,RequestMethod.POST}) 
	 * public String deleteBookmark(DetailBookmarkDto dto)throws Exception { 
	 * 		service.deleteBookmark(dto); return "detail.tiles"; 
	 * }
	 */
	@ResponseBody
	@RequestMapping(value = "addLike.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addLike (DetailLikeDto dto, Model model) throws Exception {
		int n = service.countLike(dto);
		System.out.println(n);
		
		model.addAttribute("count", n);
		
		String msg = "";
		if (n == 0) {
			boolean add = service.addLike(dto);
			System.out.println(add);
			msg = "NO";
		}else {
			boolean del = service.deleteLike(dto); 
			System.out.println("del: " + del);
			msg = "YES";
		}
		return msg;
	}
	
	@ResponseBody
	@RequestMapping(value = "countLikeAll.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String countLikeAll (int post_seq, Model model) throws Exception {
		int count = service.countLikeAll(post_seq);
		
		return count + "";
	}
	
	@ResponseBody
	@RequestMapping(value = "addReply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addReply (DetailReplyDto dto, Model model) throws Exception {
	
		boolean n = service.addReply(dto);
		
		if(n) {
			return "YES";
		}else {
			return "NO";
		}
	}

}
