package bit.com.inpho.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.inpho.dao.MessageDao;
import bit.com.inpho.dto.MessageDto;
import bit.com.inpho.dto.MessageUserDto;

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

	@Override
	public List<MessageUserDto> getUserList(int user_seq) {
		// 이전 대화 상대들 불러오기
		List<Integer> target1 = sqlSession.selectList(ns + "getListOne", user_seq);
		List<Integer> target2 = sqlSession.selectList(ns + "getListTwo", user_seq);
		
		// HashSet으로 대화상대 중복 제거
		HashSet<Integer> hashSet = new HashSet<>();
        for(Integer item : target1){
            hashSet.add(item);
        }
        for(Integer item : target2){
            hashSet.add(item);
        }
        
        // 다시 리스트에 담기....ㅎ
        List<Integer> tempint = new ArrayList<Integer>();
        tempint.addAll(hashSet);		
       
        // 유저까지 포함한 최신 메시지 리스트
        MessageUserDto[] arr = new MessageUserDto[tempint.size()];
        List<MessageUserDto> userList = new ArrayList<MessageUserDto>();
        
        for (int i = 0; i < tempint.size(); i++) {
        	// 최신 메시지 받아오기
        	 MessageDto msg = new MessageDto(user_seq, tempint.get(i));
        	 MessageDto last = sqlSession.selectOne(ns + "getLastMsg", msg);
        	 
        	 // 보낸/받은 메시지 구분값 미리 설정
        	 int isSend = 0;
        	 MessageUserDto user = new MessageUserDto();
        	 
        	 if(last.getUser_sender() != user_seq) {
        		 isSend = 1;
        		 user = sqlSession.selectOne(ns + "getUserListSend", last);
        	 }else {
        		 user = sqlSession.selectOne(ns + "getUserListTarget", last);
        	 }

        	// System.out.println("들어가기전:" + last.toString());
        	  
        	 // user_send 세션 값으로 , user_target 메시지 상대방으로 다 정하기
        	 user.setUser_sender(user_seq);
        	 user.setUser_target(tempint.get(i));
        	 
        	 // 보낸/받은 메시지 구분값 넣기
        	 user.setIsSend(isSend);
        	//userList.add(user);
        	 
        	 arr[i] = user;
        	 
        	 //System.out.println("라스트:" + user.toString());
		}
        
     // 정렬
 		MessageUserDto temp;
 		for (int i = 0; i < arr.length - 1; i++) {			
 			for (int j = i + 1; j < arr.length; j++) {
 				
 					if(arr[i].getMsg_seq() < arr[j].getMsg_seq()) {
 						temp = arr[i];
 						arr[i] = arr[j];
 						arr[j] = temp;
 					}
 				}				
 			}
 		
 		for (int i = 0; i < arr.length; i++) {
			userList.add(arr[i]);
		}

        
		return userList;
	}

	@Override
	public int setOpen(MessageDto msg) {
		return sqlSession.update(ns + "setOpen", msg);
	}

	@Override
	public boolean getUnread(int user_seq) {
		
		List<MessageDto> list = sqlSession.selectList(ns + "getUnread", user_seq);
		
		boolean b = true;
		if(list.size()==0) {
			b = false;
		}
		return b;
	}


	
}
