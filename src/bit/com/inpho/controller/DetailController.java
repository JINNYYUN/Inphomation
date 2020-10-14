package bit.com.inpho.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.inpho.dto.DetailCountAllDto;
import bit.com.inpho.dto.DetailPostDto;
import bit.com.inpho.dto.DetailReplyDto;
import bit.com.inpho.dto.MyPageMemberDto;
import bit.com.inpho.service.DetailService;
import bit.com.inpho.service.MyPageService;

@Controller
public class DetailController {
	
	@Autowired
	DetailService service;
	
	@Autowired
	MyPageService MyService;
	
	
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
	public String detail(Model model,int post_seq, DetailCountAllDto count, HttpServletRequest req) throws Exception {
		
		MyPageMemberDto login = new MyPageMemberDto(22, null, 0, null, null, null, null, null);
		
		req.getSession().setAttribute("ologin", login);
		
		MyPageMemberDto user = (MyPageMemberDto)req.getSession().getAttribute("ologin");
		
		System.out.println("seq: " +user.getUser_seq()); 
		
		/* 작성자 프로필 */
		MyPageMemberDto myPage = MyService.getProfile(post_seq);
		
		/* 디테일 세부 내용 불러오기 */
		DetailPostDto postList = service.getPost(post_seq);
		List<DetailPostDto> tagList = service.getHashTag(post_seq);
		List<DetailReplyDto> reply = service.replyList(post_seq);
		
		/* date format */
		String _date = null;
		String date= null;
		for (int i = 0; i < reply.size(); i++) {
			_date=reply.get(i).getReply_date();
		}
		
		if(_date == null) {
			_date=null;
		}else {
			date = _date.substring(0, 11); 
		}
		
		
		/* user_seq 가 0일 때	*/
		if(user.getUser_seq() == 1) {
			
			System.out.println("seq == " +user.getUser_seq()); 
			model.addAttribute("user_seq", 0);
		
		}else{
			
			HashMap<String, Integer> hMap = new HashMap<String, Integer>();
			
			hMap.put("following", postList.getUser_seq());
			hMap.put("follower", user.getUser_seq());
			
			DetailCountAllDto dto = new DetailCountAllDto(post_seq, user.getUser_seq());
			
			boolean b = MyService.isFollowing(hMap);
			
			int cLike = service.countLike(dto);
			System.out.println("cLike == " +count.getUser_seq()); 
			int cBook = service.countBookmark(dto);

			model.addAttribute("user_seq", user.getUser_seq());
			model.addAttribute("cLike", cLike);
			model.addAttribute("cBook", cBook);
			model.addAttribute("follow", b);
		}
		

		
		model.addAttribute("post", postList);
		model.addAttribute("reply", reply);
		model.addAttribute("date", date);
		model.addAttribute("tag", tagList);
		model.addAttribute("profile", myPage);
		
		return "detail.tiles";
	}
/*
	@ResponseBody
	@RequestMapping(value = "addBookmark.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addBookmark(DetailCountAllDto dto, Model model) throws Exception {
		/* bookmark 테이블에 해당 유저의 데이터가 몇 개 있는지 확인하기 위함
		int n = service.countBookmark(dto);
		System.out.println("countBookmark: "+n);
		
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
	

	@ResponseBody
	@RequestMapping(value = "addLike.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addLike (DetailCountAllDto dto, Model model) throws Exception {
		int n = service.countLike(dto);
		System.out.println(n);
		
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
	*/

	@RequestMapping(value = "addLikeBook.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addLikeBook(DetailCountAllDto dto, String word, Model model, HttpServletRequest req) throws Exception {
		System.out.println("addLikeBook:"+word);
		MyPageMemberDto user = (MyPageMemberDto)req.getSession().getAttribute("ologin");
		
		if(word.equals("heart")) {
			System.out.println("하트");
			
			int n = service.countLike(dto);
			
			if (n == 0) {
				
				boolean add = service.addLike(dto);
				System.out.println(add);
				
			}else {
				boolean del = service.deleteLike(dto); 
				System.out.println("del: " + del);
			}
			
		}else {
			System.out.println("저장");
			
			int n = service.countBookmark(dto);
			System.out.println("countBookmark: "+n);
			
			model.addAttribute("count", n);
			
			
			if (n == 0) {
				boolean add = service.addBookmark(dto);
				System.out.println(add);
				
			}else {
				boolean del = service.deleteBookmark(dto); 
				System.out.println("del: " + del);
				
			}
			
		}
		
		model.addAttribute("post_seq", dto.getPost_seq());		
		
		return "redirect:detail.do";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "countLikeAll.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String countLikeAll (int post_seq) throws Exception {
		int count = service.countLikeAll(post_seq);
		
		System.out.println("count: " + count);
		
		return count + "";
	}
	
	@ResponseBody
	@RequestMapping(value = "addReply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String addReply (DetailReplyDto dto, Model model) throws Exception {
	
		System.out.println("dto: " + dto.getPost_seq());
		System.out.println("dto: " + dto.getUser_seq());
				
		boolean n = service.addReply(dto);
		
		if(n) {
			return "YES";
		}else {
			return "NO";
		}
	}

	
	@ResponseBody
	@RequestMapping(value = "replyList.do", method = {RequestMethod.GET,RequestMethod.POST}) 
	public List<DetailReplyDto> replyList (int post_seq, Model model) throws Exception {
	
	
		List<DetailReplyDto> list = service.replyList(post_seq);
		
		System.out.println("list: " + list);
		
		return list;
		
	}
	
	@RequestMapping(value = "deleteReply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String deletReply(DetailReplyDto dto, Model model)  throws Exception{
		System.out.println("deleteReply: " + dto.getReply_seq());
		
		model.addAttribute("post_seq", dto.getPost_seq());		
		model.addAttribute("user_seq", dto.getUser_seq());		
		
		service.deleteReply(dto);
	
		return "redirect:detail.do";
				
	}
	
	@ResponseBody
	@RequestMapping(value = "follow.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String follow(int following, String work, Model model) {
		System.out.println(following + "," + work);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("following", following);
		map.put("follower", 2);
		
		MyService.follow(map, work);
		
		return "YES";
	}
	
	@RequestMapping(value = "deleteDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteDetail(int post_seq) {
		System.out.println("deleteDetail; " + post_seq);
		return "main.tiles";
	}
	
}






