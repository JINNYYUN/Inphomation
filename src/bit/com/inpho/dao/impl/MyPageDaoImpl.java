package bit.com.inpho.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.MyPageDao;
import bit.com.inpho.dto.MyPageCameraDto;
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
	
	
	
	
}
