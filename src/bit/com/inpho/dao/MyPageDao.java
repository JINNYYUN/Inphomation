package bit.com.inpho.dao;

import java.util.HashMap;
import java.util.List;

import bit.com.inpho.dto.DetailPostDto;
import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageMemberDto;

public interface MyPageDao {

	MyPageMemberDto getProfile(int seq);
	
	List<MyPageCameraDto> getCamera(int seq);
	
	int uploadProfile(MyPageMemberDto mem );
	
	List<String> getAllCam();
	
	int updateProfile(MyPageMemberDto mem);
	
	int addAllCam(List<MyPageCameraDto> addcamlist);
	
	void addMyCam(List<MyPageCameraDto> addcamlist, int user_seq);
	 
	int[] getFollowCount(int user_seq);
	
	List<MyPageMemberDto> getFollowing(int user_seq);
	
	List<MyPageMemberDto> getFollower(int user_seq);
	
	boolean isFollowing(HashMap<String, Integer> map);
	
	void follow(HashMap<String, Integer> map, String work);
	
	MyPageMemberDto pwdCheck(MyPageMemberDto mem);
	
	boolean updatePwd(MyPageMemberDto mem);
	
	List<DetailPostDto> getPost(int user_seq);
	
	}
