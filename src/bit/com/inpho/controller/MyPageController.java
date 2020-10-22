package bit.com.inpho.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import bit.com.inpho.dto.DetailCountAllDto;
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageMemberDto;
import bit.com.inpho.dto.MyPagePostDto;
import bit.com.inpho.service.DetailService;
import bit.com.inpho.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
	@Autowired
	DetailService detailService;
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage( Model model, int user_seq, HttpServletRequest req ) {
		
		// 회원정보 가져오기 (user_seq)
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		
		MyPageMemberDto mem = service.getProfile(user_seq);		
		model.addAttribute("mem", mem);

		// 팔로워/팔로잉 수 가져오기
		int[] count = service.getFollowCount(user_seq);
		model.addAttribute("following", count[0]);
		model.addAttribute("follower", count[1]);
		
		// 팔로잉 여부 가져오기
		boolean b = false;
		if(login != null) {
			HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
			hashmap.put("following", user_seq);
			hashmap.put("follower", login.getUser_seq());
			b = service.isFollowing(hashmap);
		}
		model.addAttribute("isFollowing", b);
		
		return "mypage.tiles";
	}
	
	// FOLLOW & FOLLOWING LIST 가져오기
	@RequestMapping(value = "getFollowing", method = RequestMethod.GET)
	public String getFollowing( Model model, int user_seq, HttpServletRequest req ) {

			List<MyPageMemberDto> list =  service.getFollowing(user_seq);
			MemberDto login = (MemberDto)req.getSession().getAttribute("login");

			model.addAttribute("list", list);
			
			// 팔로우 여부 가져오기
			boolean[] follow = new boolean[list.size()];
			
			if(login != null) {
				for (int i = 0; i < list.size(); i++) {
					HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
					hashmap.put("following", list.get(i).getUser_seq());
					hashmap.put("follower", login.getUser_seq());
					follow[i] = service.isFollowing(hashmap);
				}
			}else { // 로그인 안했을 경우
				for (int i = 0; i < list.size(); i++) {
					follow[i] = false;
				}
			}
			
			model.addAttribute("list", list);
			model.addAttribute("follow", follow);
			model.addAttribute("user_seq", user_seq);
	
		return "MyPageFollow.tiles";
	}
	
	@RequestMapping(value = "getFollower", method = RequestMethod.GET)
	public String getFollower( Model model, int user_seq, HttpServletRequest req ) {
		
			List<MyPageMemberDto> list = service.getFollower(user_seq);
			MemberDto login = (MemberDto)req.getSession().getAttribute("login");
			
			// 팔로우 여부 가져오기
			boolean[] follow = new boolean[list.size()];
			
			if(login != null) {
				for (int i = 0; i < list.size(); i++) {
					HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
					hashmap.put("following", list.get(i).getUser_seq());
					hashmap.put("follower", login.getUser_seq());
					follow[i] = service.isFollowing(hashmap);
				}
			}else { // 로그인 안했을 경우
				for (int i = 0; i < list.size(); i++) {
					follow[i] = false;
				}
			}
			
			model.addAttribute("list", list);
			model.addAttribute("follow", follow);
			model.addAttribute("user_seq", user_seq);

		return "MyPageFollow.tiles";
	}
	
	// FOLLOW & UNFOLLOW
	@ResponseBody
	@RequestMapping(value = "myfollow", method = RequestMethod.POST)
	public void follow( int user_seq, String work, HttpServletRequest req ) {

		//System.out.println("빨로우" + user_seq);
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("following", user_seq);
		hashmap.put("follower", login.getUser_seq());
		
		service.follow(hashmap, work);
	}
	
	// 프로필 카메라 리스트 가져오기 ajax
	@ResponseBody
	@RequestMapping(value = "getMyCamera", method = RequestMethod.POST)
	public List<MyPageCameraDto> getMyCamera( int user_seq ) {
		
		// 카메라 정보 가져오기
		List<MyPageCameraDto> camlist = service.getCamera(user_seq);
		return camlist;
	}
	
	// 게시글 가져오기 ajax
	@ResponseBody
	@RequestMapping(value = "getPost", method = RequestMethod.POST)
	public List<MyPagePostDto> getPost( int user_seq, String work, HttpServletRequest req ) {
		//System.out.println("work:" + work);
		
		List<MyPagePostDto> list = service.getPost(user_seq, work);
		
		if(list.size() == 0) {
			System.out.println("널널널");
		}
		
		// 좋아요/북마크 여부 가져오기
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		
		if(login != null) {
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
				hashmap.put("post_seq", list.get(i).getPost_seq());
				hashmap.put("login_user_seq", login.getUser_seq());
				
				boolean like = service.doLike(hashmap);
				boolean bookmark = service.doBookmark(hashmap);
				
				list.get(i).setDolike(like);
				list.get(i).setDobookmark(bookmark);
			}
		}else { //로그인 안됐을 경우
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setDolike(false);
				list.get(i).setDobookmark(false);
			}
		}
		
		return list;
	}
	
	//좋아요 추가/삭제
	@ResponseBody
	@RequestMapping(value = "addLike", method = {RequestMethod.GET, RequestMethod.POST})
	public void addLike (boolean dolike, int post_seq, HttpServletRequest req) throws Exception {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		DetailCountAllDto dto = new DetailCountAllDto(post_seq, login.getUser_seq());
		
		if(!dolike) {
			detailService.addLike(dto);
		}else {
			detailService.deleteLike(dto);
		}
		
	}
	
	// 북마크 추가/삭제
	@ResponseBody
	@RequestMapping(value = "addBookmark", method = {RequestMethod.GET, RequestMethod.POST})
	public void addBookmark (boolean dobook, int post_seq, HttpServletRequest req) throws Exception {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		DetailCountAllDto dto = new DetailCountAllDto(post_seq, login.getUser_seq());
		
		if(!dobook) {
			detailService.addBookmark(dto);
		}else {
			detailService.deleteBookmark(dto);
		}
		
	}
		
	
	
	
	
	
}
