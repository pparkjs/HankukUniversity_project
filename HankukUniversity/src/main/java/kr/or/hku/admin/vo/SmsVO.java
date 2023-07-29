package kr.or.hku.admin.vo;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class SmsVO {
	private int smsNo;
	private String smsSender;
	private String smsReceiver;
	private String smsCn;
	private String smsSendDt;
	
	public SmsVO(String userNo, String empName, String msg) {
		this.smsSender = empName;
		this.smsReceiver = userNo;
		this.smsCn = msg;
	}
}
