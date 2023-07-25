package kr.or.hku.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.hku.ServiceResult;
import kr.or.hku.common.service.CommonSMSService;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

@Slf4j
@Service
public class CommonSMSServiceImpl implements CommonSMSService {

//	final DefaultMessageService messageService;
//	
//	public CommonSMSServiceImpl() {
//		 
//	}
//	
	@Override
	public ServiceResult sendMsgToStudents(List<Map<String, String>> stdList, String msg) {
		ServiceResult res = ServiceResult.OK;
		SingleMessageSentResponse response = null;
		
		// 이게 실행 하는건데 나는 임의로 하드코딩해서 넣을거기 떄문에
//		for (int i = 0; i < stdList.size(); i++) {
//			Message message = new Message();
//			Map<String, String> map = stdList.get(i);
//			String telNo = map.get("stdTelNo").replaceAll("-", "");
//			if (telNo.length() == 11) {
//				message.setTo(telNo);
//				message.setText(msg);
//
//				response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
//			}
//		}
		
		// 임의 데이터
		String[] tels = {"010-5398-1821"};
		for (int i = 0; i < tels.length; i++) {
			Message message = new Message();
			String telNo = tels[i].replaceAll("-", "");
			if (telNo.length() == 11) {
				// 문자 전송하는사람 빠졋음 다시 너야합니다.
				
				// 여기 사이에
				message.setTo(telNo);
				message.setText(msg);
//				response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
				log.info("문자 메시지 response값 => " + response.getStatusCode());
				if (!response.getStatusCode().equals("2000")) {
					res = ServiceResult.FAILED;
					break;
				}
			}
		}
		return res;
	}
}
