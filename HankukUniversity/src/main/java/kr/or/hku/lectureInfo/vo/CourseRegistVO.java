package kr.or.hku.lectureInfo.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CourseRegistVO {
	private String stdNo;			//학번
	private String lecapNo;			// 개설신청과목
	private String crsScr;			// 수강과목성정
	private String crsEarnedCrd;	//수강과목취득학점
	private String grdDmrCn;		//성적이의내용
	private String grdDmrAns;		//성적이의답변
	private String grdDmrSttsCd;	//성적이의상태코드
	private String evalYnCd;		//강의평가여부코드
	
	// 조인해서 가져오는 필드
	private String crsClassfNm; // 이수구분이름
	private String crsClassfCd; // 이수구분코드
	private int reqCrdSum;  // 신청학점
	private int crdSum;		// 이수학점
	private String lecapYr; //개설년도
	private int lecapSem; // 개설학기
	private String subNm; // 과목이름
}
