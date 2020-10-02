package bit.com.inpho.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.MyPageDao;
import bit.com.inpho.dto.MyPageCameraDto;
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

	
}
