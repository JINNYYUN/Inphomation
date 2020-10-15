package bit.com.inpho.dao;

import java.util.List;


import bit.com.inpho.dto.PostHashTagInfoDto;

public interface PostDao {

	List<PostHashTagInfoDto> getHashTag(int postseq,int hashtagseq);

}
