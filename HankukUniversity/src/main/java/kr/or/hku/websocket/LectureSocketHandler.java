package kr.or.hku.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LectureSocketHandler extends TextWebSocketHandler {

	//로그인한 전체 session 목록 담는 List
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	// 소켓 연결시 동작
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		log.info("들어온 세션 리스트  : " + sessionList);
	}
	
	// 소켓 종료시 동작
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		for(int i = 0; i < sessionList.size(); i++) {
			if(sessionList.get(i).equals(session)) {
				sessionList.remove(sessionList.get(i));
			}
		}
	}
	
	// 메시지 받을시 동작
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		
		log.info("메시지 : " + msg);
		
		if(msg.equals("reload")) {
			TextMessage tMsg = new TextMessage("reload");
			for (WebSocketSession sess : sessionList) {
				sess.sendMessage(tMsg); 
			}
		}
		
	}
}
