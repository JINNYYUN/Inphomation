package bit.com.inpho.service;

import java.util.List;

import bit.com.inpho.dto.MemberDto;

import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostHashTagInfoDto;

public interface PostService {

	void setingPost(PostDto dto);
	List<PostHashTagInfoDto> getTag(int postseq,int hashtagseq);
	List<PostDto> getCam(MemberDto dto);
	List<PostDto>getCseq(MemberDto dto);
	void addhashtag(PostDto dto);
	int  addCamera(PostDto dto);
	String addcam(MemberDto mem,PostDto post,String[] arr);
	String addCamSeq(MemberDto mem,PostDto post,String[] arr);
	int getcamseq(PostDto dto);
}
