package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class CertificateIssuVO {
	private String ctfctisNo;
	private String stdNo;
	private String ctfctNo;
	private String ctfctisCtfctNm;
	private String ctfctisIssuDt;
	private String ctfctisExpryYmd;
	private String ctfctisAllAmt;
	private String avlCd;
}
