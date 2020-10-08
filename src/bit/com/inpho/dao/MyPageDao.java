package bit.com.inpho.dao;

import java.util.HashMap;
import java.util.List;

import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageMemberDto;

public interface MyPageDao {

	public MyPageMemberDto getProfile(int seq);
	
	public List<MyPageCameraDto> getCamera(int seq);
	
	public int uploadProfile(MyPageMemberDto mem );
	
	public List<String> getAllCam();
	
	public int updateProfile(MyPageMemberDto mem);
	
	public int addAllCam(List<MyPageCameraDto> addcamlist);
	
	public void addMyCam(List<MyPageCameraDto> addcamlist, int user_seq);
	 
	public int[] getFollowCount(int user_seq);
	
	public List<MyPageMemberDto> getFollowing(int user_seq);
	
	public List<MyPageMemberDto> getFollower(int user_seq);
	
	public boolean isFollowing(HashMap<String, Integer> map);
	
	public void follow(HashMap<String, Integer> map, String work);
	
	}
