package kr.or.hku.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlarmVO {
	private int alarmNo; // 알람번호
	private String receiveUserNo; //받는사람
	private String sendUserNo; //보내는사람
	private String alarmType; // 알림유형
	private String alarmTtl; //알림 제목
	private String alarmRegDt; // 알림보낸일자
	private String alarmPathNo; //알림 접근 번호
	
	private int totalCnt; //알람개수
	private String sendProfile; //프로필이미지경로
}
