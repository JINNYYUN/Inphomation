package bit.com.inpho.service;

import java.util.List;

import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostHashTagInfoDto;
import bit.com.inpho.dto.PostLocationDto;

public interface PostService {

	List<PostHashTagInfoDto> getTag(int postseq,int hashtagseq);
	List<MyPageCameraDto> getCam(PostDto dto);
	void setmap(PostLocationDto mdto);
	void setPost(PostDto dto);
}
