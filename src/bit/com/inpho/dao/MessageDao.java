package bit.com.inpho.dao;

import java.util.List;

import bit.com.inpho.dto.MessageDto;

public interface MessageDao {

	int sendMsg(MessageDto msg);
	
	List<MessageDto> getMsg(MessageDto msg);
	
}
