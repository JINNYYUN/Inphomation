package bit.com.inpho.service;

import java.util.List;

import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageMemberDto;

public interface MyPageService {

	public MyPageMemberDto getProfile(int seq);
	
	public List<MyPageCameraDto> getCamera(int seq);

	public boolean uploadProfile(MyPageMemberDto mem);

}
