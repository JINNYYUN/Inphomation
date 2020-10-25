package bit.com.inpho.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.PostDao;
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostHashTagInfoDto;
import bit.com.inpho.dto.PostLocationDto;
import bit.com.inpho.dto.searchDto;
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


}
