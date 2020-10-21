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
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.MyPageMemberDto;
import bit.com.inpho.service.DetailService;
import bit.com.inpho.service.MyPageService;

@Controller
public class DetailController {
	
	@Autowired
	DetailService service;
	
	@Autowired
	MyPageService MyService;
	
	
	@RequestMapping(value = "detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String detail(Model model,int post_seq, DetailCountAllDto count, HttpServletRequest req) throws Exception {
		
		MemberDto user = (MemberDto)req.getSession().getAttribute("login");
	    
		boolean b;
	      
	      if(user==null) { b=true; }
	      else { b=false; }
	      
		
		/* 디테일 세부 내용 불러오기 */
		DetailPostDto postList = service.getPost(post_seq);
		List<DetailPostDto> tagList = service.getHashTag(post_seq);
		List<DetailReplyDto> reply = service.replyList(post_seq);
		
		/* 작성자 프로필 */
		MyPageMemberDto myPage = MyService.getProfile(postList.getUser_seq());
		
		/* 좋아요 리스트 가져오기 */
		List<DetailReplyDto> likeList = service.likeList(post_seq);

		/* 작성자 게시글들 가져오기 */
		List<DetailPostDto> getAllPost = service.getAllPost(postList.getUser_seq());
		
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
		if(b) {
			
			model.addAttribute("user_seq", 0);
		
		}else{
			
			HashMap<String, Integer> hMap = new HashMap<String, Integer>();
			
			hMap.put("following", postList.getUser_seq());
			hMap.put("follower", user.getUser_seq());
			

			DetailCountAllDto dto = new DetailCountAllDto(post_seq, user.getUser_seq());
			
			boolean follow = MyService.isFollowing(hMap);
			
			int cLike = service.countLike(dto);
			int cBook = service.countBookmark(dto);

			model.addAttribute("user_seq", user.getUser_seq());
			model.addAttribute("cLike", cLike);
			model.addAttribute("cBook", cBook);
			model.addAttribute("follow", follow);
		}
		

		
		model.addAttribute("postList", getAllPost);
		model.addAttribute("likeList", likeList);
		model.addAttribute("post", postList);
		model.addAttribute("reply", reply);
		model.addAttribute("date", date);
		model.addAttribute("tag", tagList);
		model.addAttribute("profile", myPage);
		
		return "detail.tiles";
	}

	@RequestMapping(value = "addLikeBook", method = {RequestMethod.GET, RequestMethod.POST})
	public String addLikeBook(DetailCountAllDto dto, String word, Model model, HttpServletRequest req) throws Exception {
		MemberDto user = (MemberDto)req.getSession().getAttribute("login");
		
		if(word.equals("heart")) {
			
			int n = service.countLike(dto);
			
			if (n == 0) {
				
				service.addLike(dto);
				
			}else {
				service.deleteLike(dto); 
			}
			
		}else {
			
			int n = service.countBookmark(dto);
			
			model.addAttribute("count", n);
			
			
			if (n == 0) {
				service.addBookmark(dto);
				
			}else {
				service.deleteBookmark(dto); 
				
			}
			
		}
		
		model.addAttribute("login", user);
		model.addAttribute("post_seq", dto.getPost_seq());		
		
		return "redirect:detail";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "countLikeAll", method = {RequestMethod.GET, RequestMethod.POST})
	public String countLikeAll (int post_seq) throws Exception {
		int count = service.countLikeAll(post_seq);
		
		return count + "";
	}
	
	@ResponseBody
	@RequestMapping(value = "addReply", method = {RequestMethod.GET, RequestMethod.POST})
	public String addReply (DetailReplyDto dto, Model model) throws Exception {
			
		boolean n = service.addReply(dto);
		
		if(n) {
			return "YES";
		}else {
			return "NO";
		}
	}

	@RequestMapping(value = "deleteReply", method = {RequestMethod.GET, RequestMethod.POST})
	public String deletReply(DetailReplyDto dto, Model model)  throws Exception{
		
		model.addAttribute("post_seq", dto.getPost_seq());		
		model.addAttribute("user_seq", dto.getUser_seq());		
		
		service.deleteReply(dto);
	
		return "redirect:detail";
				
	}
	
	@ResponseBody
	@RequestMapping(value = "follow", method = {RequestMethod.GET, RequestMethod.POST})
	public void follow(int following, String work, int user_seq, Model model, HttpServletRequest req) {
		
		System.out.println("follow: ");
		System.out.println("follow: " + user_seq);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("following", following);
		map.put("follower", user_seq);
		
		MyService.follow(map, work);
	}
	
	@RequestMapping(value = "deleteDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteDetail(int post_seq) {
		
		service.deleteDetail(post_seq);
		
		return "redirect:main";
	}
	
	
}






