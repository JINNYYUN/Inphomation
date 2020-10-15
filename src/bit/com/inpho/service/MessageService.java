package bit.com.inpho.service;

import java.util.List;

import bit.com.inpho.dto.MessageDto;

public interface MessageService {

	int sendMsg(MessageDto msg);
	
	List<MessageDto> getMsg(MessageDto msg);
}
