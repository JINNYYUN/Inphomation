package bit.com.inpho.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.MessageDao;
import bit.com.inpho.dto.MessageDto;
import bit.com.inpho.dto.MessageUserDto;
import bit.com.inpho.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	MessageDao dao;

	@Override
	public int sendMsg(MessageDto msg) {
		return dao.sendMsg(msg);
	}

	@Override
	public List<MessageDto> getMsg(MessageDto msg) {
		return dao.getMsg(msg);
	}

	@Override
	public List<MessageUserDto> getUserList(int user_seq) {
		return dao.getUserList(user_seq);
	}
	
	
	
	
}
