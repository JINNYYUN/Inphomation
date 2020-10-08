package bit.com.inpho.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageMemberDto;
import bit.com.inpho.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage( Model model, int user_seq, HttpServletRequest req ) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 임시 세션~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!
		MyPageMemberDto login = new MyPageMemberDto(1, null, 0, null, null, null, null, null);
		
		req.getSession().setAttribute("login", login);
		//req.getSession().setMaxInactiveInterval(60 * 60 * 3);

		// 회원정보 가져오기 (user_seq)
		MyPageMemberDto sessionMem = (MyPageMemberDto)req.getSession().getAttribute("login");
		
		MyPageMemberDto mem = service.getProfile(user_seq);		
		model.addAttribute("mem", mem);
		
		System.out.println(mem.toString());
		

		// 팔로워/팔로잉 수 가져오기
		int[] count = service.getFollowCount(user_seq);
		model.addAttribute("following", count[0]);
		model.addAttribute("follower", count[1]);
		
		// 팔로잉 여부 가져오기
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("following", user_seq);
		hashmap.put("follower", sessionMem.getUser_seq());
		boolean b = service.isFollowing(hashmap);
		
		model.addAttribute("isFollowing", b);
		
		return "mypage.tiles";
	}
	
	// FOLLOW & FOLLOWING LIST 가져오기
	@RequestMapping(value = "getFollowing", method = RequestMethod.GET)
	public String getFollowing( Model model, int user_seq, HttpServletRequest req ) {

			List<MyPageMemberDto> list =  service.getFollowing(user_seq);
			MyPageMemberDto login = (MyPageMemberDto)req.getSession().getAttribute("login");

			model.addAttribute("list", list);
			
			// 팔로우 여부 가져오기
			boolean[] follow = new boolean[list.size()];
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
				hashmap.put("following", list.get(i).getUser_seq());
				hashmap.put("follower", login.getUser_seq());
				follow[i] = service.isFollowing(hashmap);
			}
			
			model.addAttribute("list", list);
			model.addAttribute("follow", follow);
			model.addAttribute("user_seq", user_seq);
	
		return "MyPageFollow.tiles";
	}
	
	@RequestMapping(value = "getFollower", method = RequestMethod.GET)
	public String getFollower( Model model, int user_seq, HttpServletRequest req ) {
		
			List<MyPageMemberDto> list = service.getFollower(user_seq);
			MyPageMemberDto login = (MyPageMemberDto)req.getSession().getAttribute("login");
			
			// 팔로우 여부 가져오기
			boolean[] follow = new boolean[list.size()];
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
				hashmap.put("following", list.get(i).getUser_seq());
				hashmap.put("follower", login.getUser_seq());
				follow[i] = service.isFollowing(hashmap);
			}
			
			model.addAttribute("list", list);
			model.addAttribute("follow", follow);
			model.addAttribute("user_seq", user_seq);

		return "MyPageFollow.tiles";
	}
	
	// FOLLOW & UNFOLLOW
	@ResponseBody
	@RequestMapping(value = "follow", method = RequestMethod.POST)
	public void follow( int user_seq, String work, HttpServletRequest req ) {

		System.out.println("빨로우" + user_seq);
		MyPageMemberDto login = (MyPageMemberDto)req.getSession().getAttribute("login");
		
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
	
	// 프로필 수정 페이지 이동
	@RequestMapping(value = "mypageedit", method = RequestMethod.GET)
	public String mypageedit( Model model ) {
		Map<String, Object> map = new HashMap<String, Object>();

		// 회원정보 가져오기 (user_seq)
		MyPageMemberDto mem = service.getProfile(1);		
		map.put("mem", mem);
		
		System.out.println(mem.toString());
		
		// 카메라 정보 가져오기
		List<MyPageCameraDto> camList = service.getCamera(1);
		map.put("camlist", camList);
		
		model.addAttribute("map", map);
		
		return "mypageedit.tiles";
	}
	
	// 프로필 수정 카메라 리스트 불러오기
	@ResponseBody
	@RequestMapping(value = "getCam", method = RequestMethod.POST)
	public List<String> getCam( Model model, String keyWord ) {
		List<String> allcamlist = service.getAllCam();
		//System.out.println("camlist" + allcamlist.get(0).toString());
		return allcamlist;
	}
	
	// 프로필 업로드창 이동
	@RequestMapping(value = "MyPageUpload", method = RequestMethod.GET)
	public String MyPageUpload() {
		System.out.println("mypageupload");
		return "MyPageUpload.tiles";
	}
	
	//프로필 이미지 업로드
	@RequestMapping(value = "MyPageUploadAf", method = {RequestMethod.GET, RequestMethod.POST})
	public void pdsupload( @RequestParam(value = "fileload", required = false)MultipartFile fileload, 
					HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		// filename 취득
		String filename = fileload.getOriginalFilename();
		//pdsdto.setOldfilename(filename);
		
		// upload 경로 설정
		// server
		String fupload = req.getSession().getServletContext().getRealPath("/upload/profileImage");
		
		// 폴더
		//String fupload = "d:\\inphoimg";
		
		System.out.println("fupload:" + fupload);
		
		// file명을 취득
		//String f = pdsdto.getOldfilename();
		String newfilename = getNewFileName( filename );	// 324324324324.txt
		
		// session
		MyPageMemberDto mem = (MyPageMemberDto)req.getSession().getAttribute("login");

		mem.setProfile_image(newfilename);
		//pdsdto.setFilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
		boolean b = true;
		
		try {
			// 실제로 파일이 업로드되는 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db에 저장
			b = service.uploadProfile(mem);
			
		} catch (IOException e) {
			e.printStackTrace();
		}	 
		
		resp.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = resp.getWriter();
		if(b) {
			out.println("<script>alert('등록되었습니다'); opener.document.location.reload();" + 
					"self.close();</script>");
		}else {
			out.println("<script>alert('등록에 실패했습니다'); location.href='MyPageUpload.tiles';</script>");
		}
		out.flush();		
	}
	
	public static String getNewFileName(String f) {
		String filename = "";
		String fpost = "";
		
		if(f.indexOf('.') >= 0) {	// 확장자명이 있음
			fpost = f.substring( f.indexOf('.') );	// .txt
			filename = new Date().getTime() + fpost;	// 43325432243.txt
		}
		else {
			filename = new Date().getTime() + ".back";
		}
		
		
		return filename;
	}
	
	// 프로필 수정 
	@RequestMapping(value = "myPageEditAf", method = RequestMethod.POST)
	public String myPageEditAf( MyPageMemberDto mem, String[] camera_serial ) {
		
		System.out.println("controller" + mem.toString());
		
		//닉네임 & 자기소개 수정
		service.updateProfile(mem);
		
		//카메라 수정
		//전체 카메라 리스트에 추가
		List<String> allcam = service.getAllCam();
		service.addAllCam(allcam, camera_serial);
		
		// 내 카메라 리스트에 추가
		allcam = service.getAllCam();
		service.addMyCam(allcam, camera_serial, mem.getUser_seq());
		
		return "redirect:/mypage?user_seq=" + mem.getUser_seq();
	}
	
	
	
	
	
}
