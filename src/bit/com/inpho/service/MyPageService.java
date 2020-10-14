package bit.com.inpho.service;

import java.util.HashMap;
import java.util.List;

import bit.com.inpho.dto.DetailPostDto;
import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageMemberDto;
import bit.com.inpho.dto.MyPagePostDto;

public interface MyPageService {

	MyPageMemberDto getProfile(int seq);
	
	List<MyPageCameraDto> getCamera(int seq);

	boolean uploadProfile(MyPageMemberDto mem);
	
	List<String> getAllCam();
	
	int updateProfile(MyPageMemberDto mem);
	
	int addAllCam(List<String> allcam, String[] camera_serial);

	void addMyCam(List<String> allcam, String[] camera_serial, int user_seq);

	int[] getFollowCount(int user_seq);
	
	List<MyPageMemberDto> getFollowing(int user_seq);
	
	List<MyPageMemberDto> getFollower(int user_seq);
	
	boolean isFollowing(HashMap<String, Integer> map);
	
	void follow(HashMap<String, Integer> map, String work);
	
	MyPageMemberDto pwdCheck(MyPageMemberDto mem);
	
	boolean updatePwd(MyPageMemberDto mem);
	
	List<MyPagePostDto> getPost(int user_seq, String work);
	
	boolean doLike(HashMap<String, Integer> map);
	
	boolean doBookmark(HashMap<String, Integer> map);
}
