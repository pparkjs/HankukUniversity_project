package kr.or.hku.admin.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholarshipVO {
	private String sclsCd;
	private String sclsNm;
	private String sclsAmt;
	private String sclsAplyBgngDt;
	private String sclsAplyEndDt;
	private String sclsTerms;
}
