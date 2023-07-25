package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TuitionVO {
	private String tutNo;
	private String stdNo;
	private String tutYr;
	private int tutSem;
	private String tutAmt;
	private String tutSclsAmt;
	private String bankCd;
	private String bankNm;
	
	private String tutPayActno;
	private String tutPayDt;
	private String avlCd;
}
