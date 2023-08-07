package kr.or.hku.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.ServiceResult;
import kr.or.hku.admin.vo.SmsTemplateVO;
import kr.or.hku.common.mapper.CommonSMSMapper;
import kr.or.hku.common.service.CommonApiService;
import kr.or.hku.common.service.CommonSMSService;
import kr.or.hku.common.vo.ApiVO;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@Service
public class CommonSMSServiceImpl implements CommonSMSService {

	private DefaultMessageService messageService;
	
	@Autowired
	private CommonApiService apiService;
	
	@Autowired
	private CommonSMSMapper smsMapper;
	
	public CommonSMSServiceImpl() {
		// 생성자는 빈의 초기화 블록에서 작업을 수행하지 않도록 변경
		this.messageService = null; // 빈 생성시 messageService는 null로 초기화
	}
	
	@PostConstruct
	public void initializeMessageService() {
		String apiType = "MSG";
		List<ApiVO> apiList = apiService.getApiId(apiType);
		String msgApiKey = null;
		String msgApiSecretKey = null;
		String msgApiDomain = null;
		for (int i = 0; i < apiList.size(); i++) {
			ApiVO apiVO = apiList.get(i);
			if (apiVO.getApiType().equals("MSG_API_KEY")) {
				msgApiKey = apiVO.getApiId();
			}else if(apiVO.getApiType().equals("MSG_API_SECRET_KEY")) {
				msgApiSecretKey = apiVO.getApiId();
			}else if (apiVO.getApiType().equals("MSG_API_DOMAIN")) {
				msgApiDomain = apiVO.getApiId();
			}
		}
		log.info(msgApiKey + msgApiSecretKey + msgApiDomain);
		 // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize(msgApiKey, msgApiSecretKey, msgApiDomain);
	}
	
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
		String apiType = "MSG_API_FROM";
		List<ApiVO> apiId = apiService.getApiId(apiType);
		String sendFrom = apiId.get(0).getApiId().trim();
		// 여기 진짜 핸드폰 번호 넣어야함 =======================================================================================
		String[] tels = {"010-6647-7508", "010-5398-1821"}; // 정재균 핸드폰 번호 입력해야함
		// 여기 진짜 핸드폰 번호 넣어야함 =======================================================================================
		for (int i = 0; i < tels.length; i++) {
			Message message = new Message();
			String telNo = tels[i].replaceAll("-", "");
			if (telNo.length() == 11) {
				// 문자 전송하는사람 빠졋음 다시 너야합니다.
				message.setFrom(sendFrom);
				// 여기 사이에
				message.setTo(telNo);
				message.setText(msg);
				response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
				log.info("문자 메시지 response값 => " + response.getStatusCode());
				if (!(response.getStatusCode().equals("2000"))) {
					res = ServiceResult.FAILED;
					break;
				}
			}
		}
		return res;
	}

	@Override
	public ServiceResult sendShMsg(List<Map<String, String>> userList, String msg) {
        String apiType = "MSG_API_FROM";
		List<ApiVO> apiId = apiService.getApiId(apiType);
		String sendFrom = apiId.get(0).getApiId().trim();
		ServiceResult result = null;
		
//        for (int i = 0; i < userList.size(); i++) {
//        	Map<String, String> map = userList.get(i);
//        	String userTelno = map.get("userTelno");
//        	userTelno = userTelno.replaceAll("-", "");
//        	if(userTelno.length() == 11) {
//        		Message message = new Message();
//        		message.setFrom(sendFrom);
//        		message.setTo(userTelno);
//        		message.setText(msg);
//        		
//				SingleMessageSentResponse response = this.messageService
//						.sendOne(new SingleMessageSendingRequest(message));
//				System.out.println(response);
//				if (!(response.getStatusCode().equals("2000"))) {
//					result = ServiceResult.FAILED;
//				}else {
//					result = ServiceResult.OK;
//				}
//        	}
//        }
		SingleMessageSentResponse response = null;
		String[] tels = {"010-6647-7508", "010-5398-1821", "010-4139-7907", "010-7925-2321"};
		// 여기 진짜 핸드폰 번호 넣어야함 =======================================================================================
		for (int i = 0; i < tels.length; i++) {
			Message message = new Message();
			String telNo = tels[i].replaceAll("-", "");
			if (telNo.length() == 11) {
				// 문자 전송하는사람 빠졋음 다시 너야합니다.
				message.setFrom(sendFrom);
				// 여기 사이에
				message.setTo(telNo);
				message.setText(msg);
				response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
				log.info("문자 메시지 response값 => " + response.getStatusCode());
				if (!(response.getStatusCode().equals("2000"))) {
					result = ServiceResult.FAILED;
					break;
				}else {
					result = ServiceResult.OK;
				}
			}
		}
        return result;
	}
	
	@Override
	public int addSmsTemplate(SmsTemplateVO smsTemplateVO) {
		return smsMapper.addSmsTemplate(smsTemplateVO);
	}
	
	@Override
	public int updateSmsTemplate(SmsTemplateVO smsTemplateVO) {
		return smsMapper.updateSmsTemplate(smsTemplateVO);
	}
}
