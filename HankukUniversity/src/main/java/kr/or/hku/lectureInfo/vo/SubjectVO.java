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
	private String subNm;
	private int subGrade;
	private int subHour;
	private int subCrd;
	private String crsClassfCd;
	private String subOtl;
}
