package kr.or.hku.admin.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholarshipAplyVO {
	private String sclsapNo;
	private String sclsCd;
	private String sclsNm;
	private String stdNo;
	private String stdNm;
	private String sclsapDt;
	private String sclsapRjctRsn;
	private String aprvSttsCd;
	private int atchFileNo;
	private String sclsapYr;
	private String sclsapSem;
}
