package bit.com.inpho.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.MessageDao;
import bit.com.inpho.dto.MessageDto;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Message.";

	@Override
	public int sendMsg(MessageDto msg) {
		return sqlSession.insert(ns + "sendMsg", msg);
	}

	@Override
	public List<MessageDto> getMsg(MessageDto msg) {
		return sqlSession.selectList(ns + "getMsg", msg);
	}
	
	
	
	
}
