package bit.com.inpho.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bit.com.inpho.postutile.GoogleVisionApi;

@RestController
public class PostHashTagController {
	@Autowired
	private GoogleVisionApi googleObj;
	private List<String> hashTag = new ArrayList<String>();
	
	
	@RequestMapping(value = "beforeImg", method = RequestMethod.POST) 
	 public String[] getHashTag(HttpServletRequest req, @RequestParam(value = "upImgFile") MultipartFile file)	throws IOException {
	
	// getRealPath()..
	String root = req.getSession().getServletContext().getRealPath("upload/postImage");
	
	System.out.println("path 1:: " + root);

	// File은 디렉토리 + 파일명
	File copyFile = new File(root + "/" + file.getOriginalFilename());
	// 원래 업로드한 파일이 지정한 path 위치로 이동...이때 카피본이 이동
	file.transferTo(copyFile);
	hashTag.removeAll(hashTag); 

	
		try {
			hashTag = googleObj.detectLabels(root + "/" + file.getOriginalFilename());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
	String result = hashTag.stream().map(n -> String.valueOf(n)).collect(Collectors.joining("#"));

	String[] before = result.split("\\#");
	for (int i = 0; i < before.length; i++) {
		before[i] = "#" + before[i];
	}
	
	
	return before;
	}
}
