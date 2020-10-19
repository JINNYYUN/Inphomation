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

import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageMemberDto;
import bit.com.inpho.postutile.UploadObjectMyPage;
import bit.com.inpho.postutile.fileUploadService;
import bit.com.inpho.service.MyPageService;

@Controller
public class MyPageEditController {

	@Autowired
	private UploadObjectMyPage obj;
	@Autowired
	private fileUploadService fileUploadService;
	
	@Autowired
	MyPageService service;
	
	// 프로필 수정 페이지 이동
	@RequestMapping(value = "mypageedit", method = RequestMethod.GET)
	public String mypageedit( Model model, HttpServletRequest req ) {
		Map<String, Object> map = new HashMap<String, Object>();

		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		
		// 회원정보 가져오기 (user_seq)
		MyPageMemberDto mem = service.getProfile(login.getUser_seq());		
		map.put("mem", mem);
		
		// 카메라 정보 가져오기
		List<MyPageCameraDto> camList = service.getCamera(login.getUser_seq());
		map.put("camlist", camList);
		
		model.addAttribute("map", map);
		
		return "mypageedit.tiles";
	}
	
	// 프로필 수정 카메라 리스트 불러오기
	@ResponseBody
	@RequestMapping(value = "getCam", method = RequestMethod.POST)
	public List<String> getCam( Model model, String keyWord ) {
		List<String> allcamlist = service.getAllCam();

		return allcamlist;
	}
	
	// 프로필 업로드창 이동
	@RequestMapping(value = "MyPageUpload", method = RequestMethod.GET)
	public String MyPageUpload() {
		//System.out.println("mypageupload");
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
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		MyPageMemberDto mem = service.getProfile(login.getUser_seq());
		
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
	
	// 구글 스토리지 업로드
	@RequestMapping(value = "MyPageFileUpload",method = {RequestMethod.POST})
	public void fileUpload(@RequestParam(value ="fileload")MultipartFile fileload,
			HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		//jspform에서 MultipartFile을 받아온다...
	    System.out.println("MultipartFile : " + fileload);
		
	        System.out.println("파일의 사이즈 : " + fileload.getSize());
	        System.out.println("업로드된 파일명 : " + fileload.getOriginalFilename());
	        System.out.println("파일의 파라미터명 : " + fileload.getName());
	        

	    //getRealPath()..
	    String root = req.getSession().getServletContext().getRealPath("/upload/profileImage");
	    System.out.println("path :: " + root);
			
	    //File은 디렉토리 + 파일명
	    File copyFile = new File(root+"/"+fileload.getOriginalFilename());
	    
	    //원래 업로드한 파일이 지정한 path 위치로 이동...이때 카피본이 이동
	    fileload.transferTo(copyFile);
	    
	    String newfilename = obj.storageUploadObject("thermal-well-290414", "boomkit", fileload.getOriginalFilename(), root + "/" + fileload.getOriginalFilename());
	    
	    // session
 		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
 		MyPageMemberDto mem = service.getProfile(login.getUser_seq());
 		mem.setProfile_image("https://storage.googleapis.com/boomkit/" + newfilename);
	    System.out.println("root:" + root);
 		//DB에 저장
 		boolean b = service.uploadProfile(mem);
 		
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
	
	
	// 프로필 수정 
	@RequestMapping(value = "myPageEditAf", method = RequestMethod.POST)
	public String myPageEditAf( MyPageMemberDto mem, String[] camera_serial ) {
		
		//System.out.println("controller" + mem.toString());
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

	//정보수정 페이지 이동
	@RequestMapping(value = "editMem", method = RequestMethod.GET)
	public String editMem(Model model, HttpServletRequest req) {
		
		MemberDto mem = (MemberDto)req.getSession().getAttribute("login");
		
		model.addAttribute("mem", mem);
		
		return "MyPageEditMem.tiles";
	}
	
	// 현재 비밀번호 확인
	@ResponseBody
	@RequestMapping(value = "checkPwd", method = RequestMethod.POST)
	public String checkPwd(MyPageMemberDto mem, String newPwd) {
		//System.out.println(mem.toString());
		MyPageMemberDto checkMem = service.pwdCheck(mem);
		
		if(checkMem != null && checkMem.getUser_seq() != 0 ) {
			// 새 비밀번호 등록
			
			mem.setUser_password(newPwd);
			boolean b = service.updatePwd(mem);
			
			return b?"yes":"no";
		}else {
			return "fail";
		}		
	}
	
	// 새 비밀번호 입력
	@RequestMapping(value = "editMemc", method = RequestMethod.GET)
	public String editMemc(int user_seq, Model model) {
		
		MyPageMemberDto mem = service.getProfile(user_seq);
		model.addAttribute("mem", mem);
		
		return "MyPageEditMem.tiles";
	}
	
}
