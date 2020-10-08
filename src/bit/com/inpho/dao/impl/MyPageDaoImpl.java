package bit.com.inpho.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.MyPageDao;
import bit.com.inpho.dto.MyPageCameraDto;
import bit.com.inpho.dto.MyPageCameraParam;
import bit.com.inpho.dto.MyPageMemberDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "Mypage.";

	@Override
	public MyPageMemberDto getProfile(int seq) {
		return sqlSession.selectOne(ns + "getProfile", seq);
	}

	@Override
	public List<MyPageCameraDto> getCamera(int seq) {		
		System.out.println("seq:" + seq);
		List<MyPageCameraDto> camlist = sqlSession.selectList(ns + "getCamera", seq);
//		System.out.println(camlist.get(0).toString());
		return sqlSession.selectList(ns + "getCamera", seq);
	}

	@Override
	public int uploadProfile(MyPageMemberDto mem) {
		return sqlSession.update(ns + "uploadProfile", mem);
	}

	@Override
	public List<String> getAllCam() {
		return sqlSession.selectList(ns + "getAllCam");
	}

	@Override
	public int addAllCam(List<MyPageCameraDto> addcamlist) {
		
		for (MyPageCameraDto cam : addcamlist) {
			System.out.println("daoImpl" + cam.toString());
			sqlSession.insert(ns + "addAllCam", cam);
		}
		return 1;
	}

	@Override
	public void addMyCam(List<MyPageCameraDto> addcamlist, int user_seq) {
		// delete
		sqlSession.delete(ns + "deleteMyCam", user_seq);
		
		if(addcamlist.size() != 0) {
			// seq 가져오기
			List<Integer> cameraSeq = new ArrayList<Integer>();
			
			for (int i = 0; i < addcamlist.size(); i++) {
				int n = sqlSession.selectOne(ns + "getMyCamSeq", addcamlist.get(i));
				cameraSeq.add(n);
			}
			
			/* 확인용
			for (int i = 0; i < cameraSeq.size(); i++) {
				System.out.println("%%" + cameraSeq.get(i));
			}*/
			
			// insert
			for (int i = 0; i < cameraSeq.size(); i++) {
				MyPageCameraParam cam = new MyPageCameraParam(user_seq, cameraSeq.get(i));
				sqlSession.insert(ns + "addMyCam", cam);
			}
		}
		
		
		
		
	}
	
	
	
	
	
	
	
}
