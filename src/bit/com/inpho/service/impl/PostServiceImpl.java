package bit.com.inpho.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.PostDao;

import bit.com.inpho.dto.PostHashTagInfoDto;
import bit.com.inpho.service.PostService;


@Service
public class PostServiceImpl implements PostService{
	@Autowired PostDao dao;
	@Override
	public List<PostHashTagInfoDto> getTag(int postseq, int hashtagseq) {
		
		return dao.getHashTag(postseq,hashtagseq);
	}
	

}
