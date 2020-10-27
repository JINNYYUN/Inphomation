package bit.com.inpho.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.MainDao;
import bit.com.inpho.dto.MainPostDto;
import bit.com.inpho.dto.MemberDto;
import bit.com.inpho.dto.searchDto;
import bit.com.inpho.service.MainService;
import bit.com.inpho.util.MemberUtil;
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
	public List<MainPostDto> getSearchFeed(String search) {
		return dao.getSearchList(search);
	}

	@Override
	public List<MainPostDto> getSearchFeed(searchDto search) {
		return dao.getSearchList(search);
	}

	@Override
	public List<MainPostDto> getNewMoreFeed(HttpSession session, searchDto search) {
		MemberDto member = (MemberDto)session.getAttribute("login");
		
		MemberUtil.settingNumber(search);
		if(member!=null) {
			search.setUserSeq(member.getUser_seq());
			return dao.getNewMoreFeed(true, search);
		}	
		return dao.getNewMoreFeed(false, search);
	}

	@Override
	public List<MainPostDto> getSearchMoreFeed(HttpSession session, searchDto search) {
		MemberDto member = (MemberDto)session.getAttribute("login");
		
		MemberUtil.settingNumber(search);
		if(member!=null) {
			search.setUserSeq(member.getUser_seq());
			return dao.getSearchMoreList(true, search);
		}
		return dao.getSearchMoreList(false, search);
	}

	@Override
	public List<MainPostDto> getHotFeed(HttpSession session) {
		MemberDto member = (MemberDto)session.getAttribute("login");
		if(member==null) {
			return dao.getHotFeedList();
		}
		searchDto search = new searchDto();
		search.setUserSeq(member.getUser_seq());
		return dao.getHotFeedList(search);
	}

}
