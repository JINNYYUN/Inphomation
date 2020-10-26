package bit.com.inpho.service.impl;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.google.gson.Gson;
import bit.com.inpho.dao.PostDao;
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostHashTagInfoDto;
import bit.com.inpho.dto.PostLocationDto;
import bit.com.inpho.service.PostService;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	PostDao dao;

	@Override
	public List<PostDto> getCseq(MemberDto dto) {

		return dao.getCseq(dto);
	}



	@Override
	public List<PostHashTagInfoDto> getTag(int postseq, int hashtagseq) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<PostDto> getCam(MemberDto dto) {
		return dao.getCamera(dto);
	}

	@Override
	public void addhashtag(PostDto dto) {
		HashMap<String, Object> postObj = new HashMap<String, Object>();
		
		List<String> pseq =new ArrayList<String>();
		
		String[] hashtags=dto.getHashtag().split(",");
		
		for (int i = 0; i < hashtags.length; i++) {
			dto.setHashtag(hashtags[i]);
			int seq=dao.getTagSeq(dto);
			dto.setTag_seq(seq);
			dao.addhashtag(dto);
		}
		
	}

	@Override
	public void setingPost(PostDto dto) {
		dao.addPost(dto);
	}

	@Override
	public int addCamera(PostDto dto) {

		return dao.addCamera(dto);
	}

	@Override
	public String addcam(MemberDto mem, PostDto post, String[] arr) {

		HashMap<String, String> memberPostObj = new HashMap<String, String>();
		memberPostObj.put("memuserseq", Integer.toString(post.getUser_seq()));
		memberPostObj.put("postcamera", post.getCamera_serial());
		for (int i = 0; i < arr.length; i++) {
			if (memberPostObj.containsValue(arr[i])) {
					return"doesNotData";
			 
			}
		}
		dao.addcam(memberPostObj);
		return "";
	}

	@Override
	public String addCamSeq(MemberDto mem, PostDto post, String[] arr) {

		HashMap<String, String> memberPostObj = new HashMap<String, String>();
		memberPostObj.put("memuserseq", Integer.toString(post.getUser_seq()));
		memberPostObj.put("postcamera", post.getCamera_serial());
		for (int i = 0; i < arr.length; i++) {
			if (memberPostObj.containsValue(arr[i])) {
				return "reroll";
			}
		}
		
		dao.addCamSeq(memberPostObj);
		return "";
	}

	@Override
	public int getcamseq(PostDto dto) {
	
		return dao.getcamseq(dto);
	}



	@Override
	public String addlocation(PostLocationDto dto) {
		dao.addlocation(dto);
		return ""; 
		
	}



	@Override
	public void upDateWrite(String tag, String loc,int seq) {
		Map<String, Object> parameter =new HashMap<String, Object>();
		String SERVER_HOST="dapi.kakao.com/v2/local/search/address.json?query=";
		String srviceKey = "KakaoAK f0e07a82a957e4d2580b19df431ebeb3";
		
		 
	            HttpHeaders headers = new HttpHeaders(); 
	            headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8"))); 
	            headers.add("Authorization", srviceKey); 
	            String urls = String.format("%s://%s%s","https", SERVER_HOST, loc); 
	             
	            @SuppressWarnings({ "rawtypes", "unchecked" }) 
	            ResponseEntity response = new RestTemplate().exchange(urls, HttpMethod.GET, new HttpEntity(headers), String.class); 

	            Gson jsonParser = new Gson(); 
	             
	               String a=jsonParser.toJson(response.getBody().toString()); 
	               System.out.println("제이슨"+a);
	               System.out.println("투스트링"+response.getBody().toString());
	               //System.out.println(parameter.get("LATITUDE"));
	               //System.out.println(parameter.get("LONGITUDE"));
		
	
		
	}


}
