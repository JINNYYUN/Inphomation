package bit.com.inpho.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.DetailDao;
import bit.com.inpho.dto.DetailBookmarkDto;
import bit.com.inpho.service.DetailService;
@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	DetailDao dao;
	
	@Override
	public boolean addBookmark(DetailBookmarkDto dto) {
		return dao.addBookmark(dto);
	}

}
