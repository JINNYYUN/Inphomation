package bit.com.inpho.controller;





import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageMemberDto;
import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostHashTagInfoDto;
import bit.com.inpho.postutile.UploadObject;
import bit.com.inpho.service.PostService;

@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	String[] camarray =new String[9999];
	@Autowired
	private UploadObject obj;
	@Autowired
	private PostService service;
	
	
	//첫 화면도착시 데이터뿌려주는  메서드
	@RequestMapping(value = "post", method = { RequestMethod.GET, RequestMethod.POST })
	public String postwrite(Model model, HttpServletRequest req) {
		logger.info("post" + new Date());
		String camkind="";
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login!=null)
			System.out.println(login.toString());
		model.addAttribute("mem",login);
		List<PostDto> camlist =new ArrayList<PostDto>();
		camlist  = service.getCam(login);
		model.addAttribute("cam",camlist);
		return "PostPage";

	}

	// 실제업로드
	@ResponseBody
	@RequestMapping(value = "Upload", method = { RequestMethod.POST })
	public ModelAndView fileUpload(HttpServletRequest req,
	@RequestParam(value = "upImgFile") MultipartFile file,PostDto dto)
			throws IOException {
		MemberDto login = (MemberDto)req.getSession().getAttribute("login");
		if(login!=null) {
			dto.setUser_seq(login.getUser_seq());
		List<PostDto> camlist =new ArrayList<PostDto>();
		camlist = service.getCam(login);
		int size = 0;
		
		for (PostDto postDto : camlist) {
		camarray[size]=postDto.getCamera_serial();
		System.out.println(camarray[size]);
		size++;
		}
		
		System.out.println(camarray);
		service.addcam(login,dto,camarray);
		service.addCamSeq(login,dto,camarray);
		int camseq=service.getcamseq(dto);
		dto.setCamera_seq(camseq);
		// MultipartFile을 받아온다... 실제 루트경로
		String root = req.getSession().getServletContext().getRealPath("upload/postImage");
		// File은 디렉토리 + 파일명
		File copyFile = new File(root + "/" + file.getOriginalFilename());
		// 원래 업로드한 파일이 지정한 path 위치로 이동...이때 카피본이 이동
		file.transferTo(copyFile);
		String after=dto.getHashtag();
		int count = 0;
        String[] str;
		for (int i = 0; i < count; i++) {
			str = after.split(",");
		}
		String exifLong= req.getParameter("exifLong");
		String exifLat= req.getParameter("exifLat");
		String exifLongResult = exifLong.substring(exifLong.lastIndexOf(",")+1);
		String exifLatResult = exifLat.substring(exifLat.lastIndexOf(",")+1);
		String fileName=obj.storageUploadObject("thermal-well-290414", "boomkit", file.getOriginalFilename(),
				root + "/" + file.getOriginalFilename());
		dto.setFilepath(fileName);
		}
		System.out.println(dto.toString());
		ModelAndView mv = new ModelAndView();
		//int nowCamseq=service.addCamera(dto);
		
		service.setingPost(dto);
		mv.setViewName("PostPage");
		
		return mv;
		
	} 
	//테스트입니당
	
	@RequestMapping(value = "reroll", method = { RequestMethod.GET,RequestMethod.POST})
	public String setHashTag(Model model) {
		
		return "PostPage";
	}@RequestMapping(value = "error", method = { RequestMethod.GET,RequestMethod.POST})
	public String gogo(Model model) {
		return "errorPage";
	}
}
