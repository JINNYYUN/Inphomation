package bit.com.inpho.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.util.TextUtils;
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

import com.google.api.client.json.Json;
import com.google.gson.Gson;

import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostLocationDto;
import bit.com.inpho.postutile.UploadObject;
import bit.com.inpho.service.PostService;

@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);

	String[] camarray = new String[9999];
	@Autowired
	private UploadObject obj;
	@Autowired
	private PostService service;

	// 첫 화면도착시 데이터뿌려주는 메서드
	@RequestMapping(value = "post", method = { RequestMethod.GET, RequestMethod.POST })
	public String postwrite(Model model, HttpServletRequest req) {
		logger.info("post" + new Date());
		String camkind = "";
		MemberDto login = (MemberDto) req.getSession().getAttribute("login");
		if (login != null)
			System.out.println(login.toString());
		model.addAttribute("mem", login);
		List<PostDto> camlist = new ArrayList<PostDto>();
		camlist = service.getCam(login);
		model.addAttribute("cam", camlist);
		return "PostPage";

	}

	// 실제업로드
	@ResponseBody
	@RequestMapping(value = "Upload", method = { RequestMethod.POST })
	public int fileUpload(HttpServletRequest req, @RequestParam(value = "upImgFile") MultipartFile file, PostDto dto,
			Model model) throws IOException {
		System.out.println("file : " + file.getOriginalFilename());
		MemberDto login = (MemberDto) req.getSession().getAttribute("login");
		if (login != null) {
			dto.setUser_seq(login.getUser_seq());
			List<PostDto> camlist = new ArrayList<PostDto>();
			camlist = service.getCam(login);
			int size = 0;
			
			for (PostDto postDto : camlist) {
				camarray[size] = postDto.getCamera_serial();
				System.out.println(camarray[size]);
				size++;
			}
		}
		System.out.println(dto.getPost_seq());
		System.out.println(camarray);
		service.addcam(login, dto, camarray);
		service.addCamSeq(login, dto, camarray);
		int camseq = service.getcamseq(dto);
		dto.setCamera_seq(camseq);
		// MultipartFile을 받아온다... 실제 루트경로
		String root = req.getSession().getServletContext().getRealPath("upload/postImage");

		// File은 디렉토리 + 파일명
		File copyFile = new File(root + "/" + file.getOriginalFilename());
		// 원래 업로드한 파일이 지정한 path 위치로 이동...이때 카피본이 이동
		file.transferTo(copyFile);
		String roadname = "";
		String exifLong = req.getParameter("exifLong");
		String exifLat = req.getParameter("exifLat");
		String fileName = obj.storageUploadObject("thermal-well-290414", "boomkit", file.getOriginalFilename(),
				root + "/" + file.getOriginalFilename());
		dto.setFilepath(fileName);

		System.out.println(dto.toString());
		roadname = req.getParameter("roadname");
		System.out.println("상호명 :: " + roadname);
		

		if (TextUtils.isEmpty(roadname)) {
			System.out.println("값이없음");
		} else {
			dto.setLocation(roadname);
			System.out.println("값있음");

		}
		service.setingPost(dto);
		service.addhashtag(dto);
		PostLocationDto Ldto = new PostLocationDto(dto.getPost_seq(), exifLong, exifLat);
		service.addlocation(Ldto);
		
		int Godetail = dto.getPost_seq();
		System.out.println(Godetail);
		return Godetail;
	}
	// 테스트입니당
	@RequestMapping(value = "postUpDate", method = { RequestMethod.GET })
	public String setHashTag(Model model, String postHashTag, String postLocation) {
	
		return "redirect:main";

	}
}
