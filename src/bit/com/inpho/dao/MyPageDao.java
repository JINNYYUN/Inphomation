package bit.com.inpho.dao;

import java.util.List;

import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageMemberDto;

public interface MyPageDao {

	public MyPageMemberDto getProfile(int seq);
	
	public List<MyPageCameraDto> getCamera(int seq);
	
	public int uploadProfile(MyPageMemberDto mem );
	
}
