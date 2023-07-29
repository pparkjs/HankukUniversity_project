package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SclsApPayVO {
	private String sclsapNo;
	private String sclsCd;
	private String sclsNm;
	private String sclsAmt;
	private String stdNo;
	private String grade;
	private String sclsapDt;
//	private String sclsapRjctRsn;
//	private String aprvSttsCd;
//	private String atchFileNo;
	private String sclsapYr;
	private String sclsapSem;
	private String sclsapPayDt;
}
