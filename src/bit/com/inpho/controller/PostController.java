package bit.com.inpho.controller;





import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostHashTagInfoDto;
import bit.com.inpho.postutile.UploadObject;
import bit.com.inpho.service.PostService;

@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	private String aftertag = "";
//	private Map<String, String> map = new HashMap<>();
	
	private PostDto dto=new PostDto();
	@Autowired
	private UploadObject obj;
	@Autowired
	private PostService service;
	
	//첫 화면도착시 데이터뿌려주는  메서드
	@RequestMapping(value = "post", method = { RequestMethod.GET, RequestMethod.POST })
	public String postwrite(Model model, HttpSession session,HttpServletRequest req,@RequestParam(value = "user_seq") int user_seq) {
		String camkind="";
		Object Id= req.getAttribute("login");
		logger.info("post" + new Date());
		System.out.println(Id);
		System.out.println(user_seq);
		dto.setUser_seq(1);
		List<MyPageCameraDto> camlist  = service.getCam(dto);
		for (MyPageCameraDto myPageCameraDto : camlist) {
			//myPageCameraDto.getCamera_image();
			myPageCameraDto.getCamera_serial();
			camkind += (myPageCameraDto.getCamera_serial()+",");
			model.addAttribute("cam",camkind);
		}
		return "PostPage";

	}

	// 실제업로드
	@ResponseBody
	@RequestMapping(value = "fileUpload", method = { RequestMethod.POST })
	public ModelAndView fileUpload(HttpServletRequest req, @RequestParam(value = "upImgFile") MultipartFile file,@ModelAttribute("post") PostDto dto)
			throws IOException {
		
		
		// jspform에서 MultipartFile을 받아온다...
		System.out.println("데이터야들어와라얍!"+dto.toString());
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
		obj.storageUploadObject("thermal-well-290414", "boomkit", file.getOriginalFilename(),
				root + "/" + file.getOriginalFilename());
		ModelAndView mv = new ModelAndView();
		service.setPost(dto);
		service.getTag(1,1);
		
		
		mv.addObject("tag", aftertag);
		mv.setViewName("PostPage");
		System.out.println("after" + aftertag);
		
		
		return mv;
		
	} 
	//테스트입니당
	@ResponseBody
	@RequestMapping(value = "#", method = { RequestMethod.GET})
	public String getHashTag(@ModelAttribute("post") PostDto dto) {
	
		List<MyPageCameraDto> camlist  =  service.getCam(dto);
		List<PostHashTagInfoDto> taglist  =  service.getTag(1,1);
		return "PostPage";
	}
}
