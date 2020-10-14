package bit.com.inpho.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import bit.com.inpho.postutile.GoogleVisionApi;
import bit.com.inpho.postutile.UploadObject;
import bit.com.inpho.postutile.tinyPngbyte;
import bit.com.inpho.postutile.fileUploadService;

@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	private String aftertag = "";
	private Map<String, String> map = new HashMap<>();
	private List<String> hashTag = new ArrayList<String>();
	@Autowired
	private tinyPngbyte uploadobj;
	@Autowired
	private GoogleVisionApi googleObj;
	@Autowired
	private UploadObject obj;
	@Autowired
	private fileUploadService fileUploadService;

	@RequestMapping("/form")
	public String form() {
		return "form";
	}

// 	@RequestMapping(value = "imageUploads", method = {RequestMethod.GET,RequestMethod.POST})
// 	public String upload(
// 			Model model,
// 			@RequestParam(value ="upImgFile",required = false) MultipartFile file ,HttpServletResponse req ) {

// 		String url = fileUploadService.restore(file);

// 		model.addAttribute("url", url);
// 		System.out.println(url); 
// 		return "PostPage";
// 	}
	@RequestMapping(value = "post", method = { RequestMethod.GET, RequestMethod.POST })
	public String postwrite(Model model, HttpSession session) {
		logger.info("post" + new Date());
		System.out.println("hello");

		// String id = ((MemberDto)session.getAttribute("login")).getUser_email();
		return "PostPage";

	}

	// 실제업로드
	@RequestMapping(value = "fileUpload", method = { RequestMethod.POST })
	public ModelAndView fileUpload(HttpServletRequest req, @RequestParam(value = "upImgFile") MultipartFile file)
			throws IOException {

		// jspform에서 MultipartFile을 받아온다...

		System.out.println("MultipartFile : " + file);

		System.out.println("파일의 사이즈 : " + file.getSize());
		System.out.println("업로드된 파일명 : " + file.getOriginalFilename());
		System.out.println("파일의 파라미터명 : " + file.getName());

		// getRealPath()..
		String root = req.getSession().getServletContext().getRealPath("upload/postImage");

		System.out.println("path :: " + root);

		// File은 디렉토리 + 파일명
		File copyFile = new File(root + "/" + file.getOriginalFilename());

		// 원래 업로드한 파일이 지정한 path 위치로 이동...이때 카피본이 이동
		file.transferTo(copyFile);
		List<String> hashTag = obj.storageUploadObject("thermal-well-290414", "boomkit", file.getOriginalFilename(),
				root + "/" + file.getOriginalFilename());
		ModelAndView mv = new ModelAndView();
		System.out.println("toString" + hashTag.toString());
		System.out.println("origenal" + hashTag);

		String result = hashTag.stream().map(n -> String.valueOf(n)).collect(Collectors.joining("#"));

//	    for (int i = 0; i < result.length(); i++) {
//			String[] resultTag=result.split("-");
//			for (int j = 0; j < resultTag.length; j++) {
//				String a=resultTag[j];
//				System.out.println(a);
//			}
//		}
		String[] before = result.split("\\#");
		for (int i = 0; i < before.length; i++) {
			String after = "#" + before[i];
			aftertag = aftertag + after;
		}
		mv.addObject("tag", aftertag);
		mv.setViewName("PostPage");
		System.out.println("after" + aftertag);

		return mv;

	}
// 비전api는 form 양식에 멀티파트 타입 없애고 ajax 통신시에 타입을 끼워주자
	@RequestMapping(value = "beforeImg", method = RequestMethod.POST) 
		@ResponseBody public String[] getHashTag(HttpServletRequest req, @RequestParam(value = "upImgFile") MultipartFile file)	throws IOException {
		
		System.out.println("ImgUPUP : " + file);
		System.out.println("파일의 사이즈 : " + file.getSize());
		System.out.println("업로드된 파일명 : " + file.getOriginalFilename());
		System.out.println("파일의 파라미터명 : " + file.getName());

		// getRealPath()..
		String root = req.getSession().getServletContext().getRealPath("upload/postImage");
		
		System.out.println("path :: " + root);

		// File은 디렉토리 + 파일명
		File copyFile = new File(root + "/" + file.getOriginalFilename());
		// 원래 업로드한 파일이 지정한 path 위치로 이동...이때 카피본이 이동
		file.transferTo(copyFile);
		hashTag.removeAll(hashTag); 
		System.out.println(hashTag.toString());
		
			try {
				hashTag = googleObj.detectLabels(root + "/" + file.getOriginalFilename());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		System.out.println("toString" + hashTag.toString());
		System.out.println("orignal" + hashTag);

		String result = hashTag.stream().map(n -> String.valueOf(n)).collect(Collectors.joining("#"));

		String[] before = result.split("\\#");
		for (int i = 0; i < before.length; i++) {
			before[i] = "#" + before[i];
		}
	
		System.out.println("after" + before.toString());

		return before;
	}
}
