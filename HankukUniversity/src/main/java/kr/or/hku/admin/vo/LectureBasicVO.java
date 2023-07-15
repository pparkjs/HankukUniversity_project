package kr.or.hku.admin.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LectureBasicVO {
	private int lecapNo;
	private String subNo;
	private String subNm;
	private String deptNm;
	private String subGrade;
	private String subCrd;
	private String lecapCpct;
	private String lecapYr;
	private String lecapSem;
	private String crsClassfCd;
	private String proNm;
	private String proMail;
	private String proTelno;
	// 내 시간표
	private String lecscDay;
	private String periodCd;
	private String lecscHour;
	
	// 건물 정보
	private String flctsNm;
	//강의실 번호
	private String flctNm;
}
