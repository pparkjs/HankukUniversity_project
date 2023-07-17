package kr.or.hku.lectureInfo.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubjectVO {
	private String subNo;
	private String deptCd;
	private String deptNm;
	private String subNm;
	private int subGrade;
	private int subHour;
	private int subCrd;
	private String crsClassfCd;
	private String comCdNm;	// 전필,전선 등등...
	private String subOtl;
	
	
	
	private String lecapNo;
}
