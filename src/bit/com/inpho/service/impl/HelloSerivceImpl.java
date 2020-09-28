package bit.com.inpho.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.HelloDao;
import bit.com.inpho.service.HelloService;

@Service
public class HelloSerivceImpl implements HelloService {

	@Autowired
	HelloDao dao;
	
	@Override
	public String getName(String id) {
		return dao.getName(id);
	}

	
}
