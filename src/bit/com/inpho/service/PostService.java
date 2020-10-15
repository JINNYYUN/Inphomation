package bit.com.inpho.service;

import java.util.List;
import bit.com.inpho.dto.PostHashTagInfoDto;

public interface PostService {

	List<PostHashTagInfoDto> getTag(int postseq,int hashtagseq);

}
