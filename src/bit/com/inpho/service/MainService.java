package bit.com.inpho.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import bit.com.inpho.dto.MainPostDto;
import bit.com.inpho.dto.searchDto;

public interface MainService {
	public List<MainPostDto> getNewFeed();
	public List<MainPostDto> getNewFeed(int userSeq);
	public List<MainPostDto> getNewMoreFeed(HttpSession session, searchDto search);
	public List<MainPostDto> getSearchFeed(String search);
	public List<MainPostDto> getSearchFeed(searchDto search);
	public List<MainPostDto> getSearchMoreFeed(HttpSession session,searchDto search);
	public List<MainPostDto> getHotFeed(HttpSession session);
}
