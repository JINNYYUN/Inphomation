package bit.com.inpho.service;

import java.util.List;

import bit.com.inpho.dto.MainPostDto;
import bit.com.inpho.dto.searchDto;

public interface MainService {
	public List<MainPostDto> getNewFeed();
	public List<MainPostDto> getNewFeed(int userSeq);
	public List<MainPostDto> getSearchFeed(String search);
	public List<MainPostDto> getSearchFeed(searchDto search);
}
