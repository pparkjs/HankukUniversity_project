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
	private String crsGrd;			// 취득등급
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
	private String deptNm; //수강과목의 학과
	private String subNo; //수강과목번호
	private String subCrd; //수강과목번호
	
	private String assignScr;//과제점수
	private String middleScr;//중간점수
	private String finalScr;//기말점수
	private String attendScr; //출석점수
}
