package bit.com.inpho.dao;

import java.util.List;

import bit.com.inpho.dto.MainPostDto;

public interface MainDao {
	
	public List<MainPostDto> getNewFeed();
	public List<MainPostDto> getNewFeed(int userSeq);
}
