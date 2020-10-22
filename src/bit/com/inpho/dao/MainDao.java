package bit.com.inpho.dao;

import java.util.List;

import bit.com.inpho.dto.MainPostDto;
import bit.com.inpho.dto.searchDto;

public interface MainDao {
	
	public List<MainPostDto> getNewFeed();
	public List<MainPostDto> getNewFeed(int userSeq);
	public List<MainPostDto> getSearchList(String search);
	public List<MainPostDto> getSearchList(searchDto search);
}
