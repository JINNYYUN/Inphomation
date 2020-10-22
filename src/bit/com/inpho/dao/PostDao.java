package bit.com.inpho.dao;

import java.util.HashMap;
import java.util.List;

import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostHashTagInfoDto;
import bit.com.inpho.dto.PostLocationDto;

public interface PostDao {
	List<PostHashTagInfoDto> getHashTag(List<String> hashtags);
	List<PostDto>getCamera(MemberDto dto);
	List<PostDto>getCseq(MemberDto userseq);
	int addCamera(PostDto dto);
	void setHashTag(int postseq,int hashtagseq);
	void setmap(PostLocationDto map);
	void addPost(PostDto dto);
	void addcam(HashMap<String, String> map);
	void addCamSeq(HashMap<String, String> map);
	void addhashtag(HashMap<String, Object> obj);
	int getcamseq(PostDto dto);
	void setingPost(PostDto dto);
} 

