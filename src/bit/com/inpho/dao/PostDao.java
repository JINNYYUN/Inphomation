package bit.com.inpho.dao;

import java.util.List;

import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.PostDto;
import bit.com.inpho.dto.PostHashTagInfoDto;
import bit.com.inpho.dto.PostLocationDto;

public interface PostDao {
	void setHashTag(int postseq,int hashtagseq);
	List<PostHashTagInfoDto> getHashTag(int postseq,int hashtagseq);
	List<MyPageCameraDto>getCamera(PostDto dto);
	void setmap(PostLocationDto map);
	
}
