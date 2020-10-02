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
import org.springframework.web.multipart.MultipartFile;

import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageMemberDto;
import bit.com.inpho.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage( Model model, int user_seq ) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 회원정보 가져오기 (user_seq)
		
		MyPageMemberDto mem = service.getProfile(1);		
		map.put("mem", mem);
		
		System.out.println(mem.toString());
		
		// 카메라 정보 가져오기
		List<MyPageCameraDto> camList = service.getCamera(2);
		map.put("camlist", camList);
		
		model.addAttribute("map", map);
		
		return "mypage.tiles";
	}
	
	@RequestMapping(value = "mypageedit", method = RequestMethod.GET)
	public String mypageedit( Model model, int user_seq ) {
		Map<String, Object> map = new HashMap<String, Object>();

		// 회원정보 가져오기 (user_seq)
		MyPageMemberDto mem = service.getProfile(1);		
		map.put("mem", mem);
		
		System.out.println(mem.toString());
		
		// 카메라 정보 가져오기
		List<MyPageCameraDto> camList = service.getCamera(2);
		map.put("camlist", camList);
		
		model.addAttribute("map", map);
		
		return "mypageedit.tiles";
	}
	
	@RequestMapping(value = "MyPageUpload", method = RequestMethod.GET)
	public String MyPageUpload() {
		System.out.println("mypageupload");
		return "MyPageUpload.tiles";
	}
	
	@RequestMapping(value = "MyPageUploadAf", method = {RequestMethod.GET, RequestMethod.POST})
	public void pdsupload( @RequestParam(value = "fileload", required = false)MultipartFile fileload, 
					HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		// filename 취득
		String filename = fileload.getOriginalFilename();
		//pdsdto.setOldfilename(filename);
		
		// upload 경로 설정
		// server
		//String fupload = req.getSession().getServletContext().getRealPath("/upload");
		
		// 폴더
		String fupload = "d:\\inphoimg";
		
		System.out.println("fupload:" + fupload);
		
		// file명을 취득
		//String f = pdsdto.getOldfilename();
		String newfilename = getNewFileName( filename );	// 324324324324.txt
		
		MyPageMemberDto mem = new MyPageMemberDto();
		
		// session 받아서 넣기
		mem.setUser_seq(1);
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
	
	
	
}
