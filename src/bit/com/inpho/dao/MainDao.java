package bit.com.inpho.dao;

import java.util.List;

import bit.com.inpho.dto.MainPostDto;
import bit.com.inpho.dto.searchDto;

public interface MainDao {
	
	public List<MainPostDto> getNewFeed();
	public List<MainPostDto> getNewFeed(int userSeq);
	public List<MainPostDto> getNewMoreFeed(boolean cate, searchDto search);
	
	public List<MainPostDto> getSearchList(String search);
	public List<MainPostDto> getSearchList(searchDto search);
	public List<MainPostDto> getSearchMoreList(boolean cate,searchDto search);
	
	public List<MainPostDto> getHotFeedList();
	public List<MainPostDto> getHotFeedList(searchDto search);
	public List<MainPostDto> getHotFeedMoreList(boolean cate, searchDto search);
}
