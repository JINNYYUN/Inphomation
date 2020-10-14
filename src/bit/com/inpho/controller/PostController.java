package bit.com.inpho.controller;



import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bit.com.inpho.postutile.GoogleVisionApi;
import bit.com.inpho.postutile.UploadObject;
import bit.com.inpho.postutile.tinyPngbyte;
import bit.com.inpho.postutile.fileUploadService;

	

@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	//@Autowired
	//private tinyPngbyte uploadobj;
	
	@Autowired
	private GoogleVisionApi gcpobj;
	@Autowired
	private UploadObject obj;
	@Autowired
	private fileUploadService fileUploadService;
	
	@RequestMapping( "/form" )
	public String form() {
		return "form";
	}
	
	@RequestMapping(value = "imageUploads", method = {RequestMethod.GET,RequestMethod.POST})
	public String upload(
			Model model,
			@RequestParam(value ="upImgFile",required = false) MultipartFile file ,HttpServletResponse req ) {
		
		String url = fileUploadService.restore(file);
		
		model.addAttribute("url", url);
		System.out.println(url); 
		return "PostPage";
	}
	@RequestMapping(value = "post", method = {RequestMethod.GET,RequestMethod.POST})
	public String postwrite(Model model,HttpSession session) {
		logger.info("post"+new Date());
		System.out.println("hello");
		System.out.println(new java.io.File(".").getAbsolutePath());
//		String id = ((MemberDto)session.getAttribute("login")).getUser_email();
		return "PostPage";
		
	}
	@RequestMapping(value = "imageUpload",method = {RequestMethod.POST})
	public String getimagepath(byte[] imagePath) {
		
		System.out.println(imagePath);
		try {
			
			//uploadobj.getBaseDecode(imagePath);
			//uploadobj.tinyUpload(imagePath,"테스트입니다..ㅎ");
			//obj.storageUploadObject("thermal-well-290414", "boomkit", "examples", imagePath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "detail.tiles";
	}
	
	@RequestMapping(value = "fileUpload",method = {RequestMethod.POST})
	public String fileUpload(HttpServletRequest req, @RequestParam(value ="upImgFile")
	MultipartFile file) throws IOException {
			
	    //jspform에서 MultipartFile을 받아온다...
	    
	    System.out.println("MultipartFile : " + file);
		
	        System.out.println("파일의 사이즈 : " + file.getSize());
	        System.out.println("업로드된 파일명 : " + file.getOriginalFilename());
	        System.out.println("파일의 파라미터명 : " + file.getName());
	        

	    //getRealPath()..
	    String root = req.getSession().getServletContext().getRealPath("upload/postImage");
	    
	    System.out.println("path :: " + root);
			
	    //File은 디렉토리 + 파일명
	    File copyFile = new File(root+"/"+file.getOriginalFilename());
	    
	    //원래 업로드한 파일이 지정한 path 위치로 이동...이때 카피본이 이동
	    file.transferTo(copyFile);
	    obj.storageUploadObject("thermal-well-290414", "boomkit", file.getOriginalFilename(),root+"/"+file.getOriginalFilename());
	    return "PostPage";
	    
	}
}
