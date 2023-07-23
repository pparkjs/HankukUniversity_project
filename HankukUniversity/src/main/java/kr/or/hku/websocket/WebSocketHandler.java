package kr.or.hku.websocket;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.hku.student.service.StudyService;
import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.StudyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketHandler extends TextWebSocketHandler {
	
	@Inject
	StudyService service;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	//채팅방 목록 Map<방 번호(key), ArrayList<session> >이 들어감. key : 방번호, value : 해당 채팅방에 참여하는 WebSocketSession 객체들의 리스트
	private Map<Integer, ArrayList<WebSocketSession>> roomList = new ConcurrentHashMap<Integer, ArrayList<WebSocketSession>>();
	
	// 해당 userId 와 그에 따르는 session 관리 Map
	private Map<WebSocketSession, String> userSessionMap = new ConcurrentHashMap<WebSocketSession, String>();

	//로그인한 전체 session 목록 담는 List
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static int i;
	
	// 웹소켓 연결 성공시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		System.out.println(session.getId() + " 연결 성공 => 총 접속 인원 : " + i + "명");
		System.out.println();
		String stdNo = getUserId(session);
		
		userSessionMap.put(session, stdNo);
		log.info("연결한놈 stdNo: " + stdNo);
		
		sessionList.add(session);
		
		// 해당 유저가 속해있는 채팅방 가져오기
		List<StudyVO> list = getRoomListById(stdNo);

		// 해당 유저가 속해있는 채팅방이 있는 경우만 실행
		if(list != null) {
			for (StudyVO study : list) {
				ArrayList<WebSocketSession> userList = new ArrayList<>();
				roomList.put(study.getStudyNo(), userList);
			}
		}
		
		for (StudyVO study : list) {
			System.out.println("님이 속해 있는 방 : " + study.getStudyName());
		}
		
		System.out.println();
		System.out.println("연결 후 roomList 상태 : " + roomList);
		for(int i = 14; i <= 17; i++) {
			if(roomList.get(i) != null) {
				for(int j = 0; j < roomList.get(i).size(); j++) {
					System.out.println(i + "번방에 들어있는 유저 session["+j+"] : " + roomList.get(i).get(j));
				}
			}
		}
		System.out.println("연결 후 userSessionMap 상태 :" + userSessionMap);
	}

	// 웹소켓으로 HttpSession에 있는 userId 가져오기
	private String getUserId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		 for (String key : httpSession.keySet()) {
	            Object value = httpSession.get(key);
	            log.info("key: "+key + ": " + value);
	        }
		StudentVO loginUser = (StudentVO) httpSession.get("std");
		log.info("사람 여기 있어요 !: " + loginUser);
		if (loginUser == null) {
			log.info("여기체킁1");
			return session.getId(); // WebSocketSession의 sessionid 반환
		} else {
			log.info("여기체킁2");
			return loginUser.getStdNo();
		}
	}
	
	// 로그인한 유저 아이디가 속해있는 채팅방 리스트 가져오는 메소드
	private List<StudyVO> getRoomListById(String stdNo){
		return service.studyList(stdNo);
	}
	
	// websocket 연결 종료 시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		i--;
		System.out.println(session.getId() + " 연결 종료 => 총 접속 인원 : " + i + "명");
		System.out.println();

		String userId = getUserId(session);
		// 해당 유저가 속해있는 채팅방 가져오기
		List<StudyVO> list = getRoomListById(userId);

		// 연결끊은 해당 유저 맵에 삭제
		userSessionMap.remove(session);
		
		// 해당 유저가 속해있는 방이 존재하는 경우만 실행
		if(list != null) {
			for (StudyVO study : list) {
				// roomList에 방에 해당하는 List에 누군가 있는경우
				if(roomList.get(study.getStudyNo()) != null) {
					// 해당 List에서 연결끊은 session 삭제
					roomList.get(study.getStudyNo()).remove(session);
				}
			}
		}
		
		for(int i = 0; i < sessionList.size(); i++) {
			if(sessionList.get(i).equals(session)) {
				sessionList.remove(sessionList.get(i));
			}
		}
		
	}
	/**
	 * websocket 메세지 수신 및 송신
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 메시지에서 페이로드(본문)를 가져오는 메소드로 전달받은 메시지를 문자열 형태의 페이로드로 반환
		String msg = message.getPayload();

		// Json객체 → Java객체
		// 출력값 : [stNo=1, messageId=null, messageRegdate=null, messageContent=안녕,
		// userName=박정수, userId=a123, unReadCount=0, type=msg]
		StudyVO studyVo = objectMapper.readValue(msg, StudyVO.class);
		
		// 해당 채팅방 인원수 가져오기
		int memCnt = service.getMemberCount(studyVo.getStudyNo());
		studyVo.setUnreadMsgCnt(memCnt);
		
		int studyNo = studyVo.getStudyNo(); // study 방번호
		String userId = getUserId(session); // userId
		
		// 해당 유저가 속해있는 채팅방 가져오기
		List<StudyVO> list = getRoomListById(userId);
				
		// 방에 입장 시 해당 방에 세션 추가
		if(studyVo.getType().equals("enter-room")) {
			
			//------------------방에 세션 추가하기 전에 기존에 들어가 있던 방에서 세션 삭제---------------

			// 해당 유저가 속해있는 방이 존재하는 경우만 실행
			if(list != null) {
				for (StudyVO study : list) {
						// roomList에 내가 속해있는 모든방에 나의 session 삭제
						log.info(""+study.getStdNo());
						roomList.get(study.getStudyNo()).remove(session);
				}
				roomList.get(studyNo).add(session); // 방에 들어온 유저 세션리스트에 세션 추가
			}
			//------------------------------------------------------------------------------
			
			System.out.println();
			System.out.println("방 접속 후 roomList 상태 : " + roomList);
			for(int i = 14; i <= 17; i++) {
				if(roomList.get(i) != null) {
					for(int j = 0; j < roomList.get(i).size(); j++) {
						System.out.println(i + "번방에 들어있는 유저(접속 후 상태) session["+j+"] : " + roomList.get(i).get(j));
					}
				}
			}
			
			// 해당 RoomList에 들어온 사람이 2명이면 sessionCount = 2;
			for (WebSocketSession sess : roomList.get(studyNo)) {
				String stdNo = userSessionMap.get(sess);
				studyVo.setStdNo(stdNo);
				
				// 해당 방에 채팅 메시지 안읽은 개수 가져오기
				List<Integer> msgIdList = service.getUnreadCntByUser(studyVo);
				for (Integer msgId : msgIdList) {
					studyVo.setMsgNo(msgId);
					// 방안에서 해당 messageId에대한  메시지 읽음 카운트 -1 처리 
					service.readMessageInRoom(studyVo);
				}
			}
			
			// 채팅방에 들어오면 읽음 처리 하기
			service.readChatMessage(studyVo);
			
			// 현재 들어와 있는 모든 세션에게 reload 메시지 전송 (메시지 채팅방목록 ajax 다시 뿌리기 위함)
			TextMessage tMsg = new TextMessage("reload");
			for(WebSocketSession sess : sessionList) {
				sess.sendMessage(tMsg);
			}
			
		}
		// 채팅 메세지 입력 시
		else if(roomList.get(studyNo) != null && studyVo.getType().equals("msg")) {
			LocalDateTime currentDateTime = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String formattedDateTime = currentDateTime.format(formatter);
			
			// DB에 메시지 등록
			service.insertMessage(studyVo);
			
			// 현재 session 수
			int sessionCount = 0;

			for (WebSocketSession sess : roomList.get(studyNo)) {
				sessionCount++;
			}
			
//			// 메세지에 이름, 아이디, 내용을 담는다.
			TextMessage textMessage = new TextMessage(studyVo.getStudyNo() + "," + studyVo.getStdNo() + ","
					+ studyVo.getMsgContent() + "," + formattedDateTime + "," + (studyVo.getUnreadMemCnt()-sessionCount));
			
			// 해당 채팅방에 속한 모든 세션에게 메시지 전송함
			// 해당 RoomList에 들어온 사람이 2명이면 sessionCount = 2;
			for (WebSocketSession sess : roomList.get(studyNo)) {
				String uId = userSessionMap.get(sess);
				studyVo.setStdNo(uId);
				
				// 해당 방에 채팅 메시지 안읽은 개수 가져오기
				List<Integer> msgIdList = service.getUnreadCntByUser(studyVo);
				for (Integer msgId : msgIdList) {
					studyVo.setMsgNo(msgId);
					// 방안에서 해당 messageId에대한  메시지 읽음 카운트 -1 처리 
					service.readMessageInRoom(studyVo);
				}
				
				// 해당 채팅방에 들어가 있는 상태에서 대화 오고갈때 바로 읽음 처리 되기 위함.(채팅방 들어가기 전 새로운 채팅메시지의 개수 읽음처리)
				service.readChatMessage(studyVo);
				
				sess.sendMessage(textMessage);
			}
			
			System.out.println(studyNo + "방에 들어온 세션 수" + sessionCount);
	
			// 메시지 전송 시 마다 현재 들어와 있는 모든 세션에게 reload 메시지 전송 (메시지 채팅방목록 ajax 다시 뿌리기 위함)
			TextMessage tMsg = new TextMessage("reload");
			for(WebSocketSession sess : sessionList) {
				sess.sendMessage(tMsg);
			}

		}
		// 닫기 버튼 눌를 시
		else if(studyVo.getType().equals("close-room")) {
			// roomList에 내가 속해있던 방에 나의 session 삭제
			roomList.get(studyNo).remove(session);
		} 
	}

}
