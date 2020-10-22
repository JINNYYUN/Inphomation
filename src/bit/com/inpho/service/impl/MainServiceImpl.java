package bit.com.inpho.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.MainDao;
import bit.com.inpho.dto.MainPostDto;
import bit.com.inpho.dto.searchDto;
import bit.com.inpho.service.MainService;
@Service
public class MainServiceImpl implements MainService{
	@Autowired
	MainDao dao;
	
	@Override
	public List<MainPostDto> getNewFeed() {
		return dao.getNewFeed();
	}

	@Override
	public List<MainPostDto> getNewFeed(int userSeq) {
		return dao.getNewFeed(userSeq);
	}

	@Override
	public List<MainPostDto> getSearchFeed(searchDto search) {
		return dao.getSearchList(search);
	}

}
