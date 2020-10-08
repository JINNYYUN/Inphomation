package bit.com.inpho.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.MyPageDao;
import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageCameraParam;
import bit.com.inpho.dto.MyPageMemberDto;
import bit.com.inpho.service.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDao dao;

	@Override
	public MyPageMemberDto getProfile(int seq) {
		return dao.getProfile(seq);
	}

	@Override
	public List<MyPageCameraDto> getCamera(int seq) {
		return dao.getCamera(seq);
	}

	@Override
	public boolean uploadProfile(MyPageMemberDto mem) {
		int n = dao.uploadProfile(mem);
		return n>0?true:false;
	}

	@Override
	public List<String> getAllCam() {
		return dao.getAllCam();
	}
	

	@Override
	public int updateProfile(MyPageMemberDto mem) {
		return dao.updateProfile(mem);
	}

	@Override
	public int addAllCam(List<String> allcam, String[] camera_serial) {
		
		// 입력된 카메라 값 중복제거
		HashSet<String> hashSet = new HashSet<>();
	
        for(String item : camera_serial){
            hashSet.add(item);
        }
		
        List<String> camera_serial_list = new ArrayList<String>(hashSet); // 중복이 제거된 HashSet을 다시 ArrayList에 삽입

		// 기존 카메라 데이터와의 중복 제거 & ""값 제거
		List<MyPageCameraDto> addcamlist = new ArrayList<MyPageCameraDto>();
		
		for (int i = 0; i < camera_serial_list.size(); i++) {
			if(!allcam.contains(camera_serial_list.get(i)) && !camera_serial_list.get(i).equals("")){
				addcamlist.add( new MyPageCameraDto(camera_serial_list.get(i)) );
			}
	                
		}
	
		for (int i = 0; i < addcamlist.size(); i++) {
			System.out.println("!!" + addcamlist.get(i).toString());
		}
		
		// 1. 새로운 카메라 데이터가 없을 경우
		if(addcamlist.size() == 0) {
			System.out.println("PELASE!!!!");	
			return 0;
		}

		return dao.addAllCam(addcamlist);
		
	}

	@Override
	public void addMyCam(List<String> allcam, String[] camera_serial, int user_seq) {
		
		// 입력된 카메라 값 중복제거
		HashSet<String> hashSet = new HashSet<>();
	
        for(String item : camera_serial){
        	if( !item.equals("") ) {   // ""값 제거
        		 hashSet.add(item);
        	}
        }
		        
        List<MyPageCameraDto> camlist = new ArrayList<MyPageCameraDto>();
        for (String item : hashSet) {
			camlist.add(new MyPageCameraDto(item));
		}        
		
     
        for (MyPageCameraDto cam : camlist) {
        	System.out.println("~~~serviceImpl" + cam.toString());
		}
   
		dao.addMyCam(camlist, user_seq);	
	
	}

	@Override
	public int[] getFollowCount(int user_seq) {
		return dao.getFollowCount(user_seq);
	}

	@Override
	public List<MyPageMemberDto> getFollowing(int user_seq) {
		return dao.getFollowing(user_seq);
	}

	@Override
	public List<MyPageMemberDto> getFollower(int user_seq) {
		return dao.getFollower(user_seq);
	}

	@Override
	public boolean isFollowing(HashMap<String, Integer> map) {
		return dao.isFollowing(map);
	}

	@Override
	public void follow(HashMap<String, Integer> map, String work) {
		dao.follow(map, work);
	}
	
	
	

	
}
