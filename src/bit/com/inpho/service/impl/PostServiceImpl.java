package bit.com.inpho.service.impl;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
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
	                   String[] tags =tag.split("#");
	                   String afTag ="";
	                    
	                   for (int i = 0; i < tags.length; i++) {
	                	   if(tags.length == i+1){
	                		   break;
	                	   }
	                	  afTag+=("#"+tags[i+1]+",");
	                	  
					}
	                   tags=afTag.split(",");
	                   parameter.put("seq", seq);
	                   parameter.put("loc", loc);
	                   parameter.put("tag", tags);
	                   
	                   PostDto dto= new PostDto();
	                   
	                   String postSeq= Integer.toString(seq);
	                   dao.deleteTagSeq(postSeq);
	                   for (int i = 0; i < tags.length; i++) {
	                	   dto.setPost_seq(seq);
	                	   dto.setHashtag(tags[i]);
	                	   int postseq=dao.getTagSeq(dto);
	                	   dto.setTag_seq(postseq);
	                	   dao.addhashtag(dto);
	                	   
           }
	 
		}
	}