package kr.or.hku.lectureInfo.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {
	private String stdNo;
	private String lecapNo;
	private String cartRegdate;
	private String applYn;
	private String backColor;
	
	// 시간표 비교를 위한 필드 추가
	private int endPeriod;
	private int periodCd;
	private String lecscDay;
	private int lecscHour;
	
	// 조인해서 가져올 필드
	private String subNo;
	private String subNm;
	private String proNm;
	private int lecapTgGrade;
	private int subCrd;
	private String deptNm;
}
