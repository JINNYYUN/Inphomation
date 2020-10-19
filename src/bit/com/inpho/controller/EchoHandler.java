package bit.com.inpho.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
    //세션 리스트
	private List<WebSocketSession> users;
	private Map<String, Object> userMap;
	
	public EchoHandler() {
		users= new ArrayList<WebSocketSession>();
		userMap = new HashMap<String,Object>();
	}
	
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	users.add(session);
        logger.info("{} 연결됨", session.getId()); 
        
       // String senderEmail = getEmail(session);
		// userSessionsMap.put(senderEmail, session);
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        
        JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");
        
		if(type != null && type.equals("register") ) {
			//등록 요청 메시지
			String user = object.getString("userid");
			//아이디랑 Session이랑 매핑 >>> Map
			userMap.put(user, session);
		}else {
			//채팅 메시지 : 상대방 아이디를 포함해서 메시지를 보낼것이기 때문에
			//Map에서 상대방 아이디에 해당하는 WebSocket 꺼내와서 메시지 전송
			String target = object.getString("target");
			WebSocketSession ws = (WebSocketSession)userMap.get(target);
			String msg = object.getString("from") +"*"+ object.getString("message");
			if(ws !=null ) {
				ws.sendMessage(new TextMessage(msg));
			}
		}
        
    }
    
    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	users.remove(session);
        logger.info("{} 연결 끊김.", session.getId());
    }
    
}