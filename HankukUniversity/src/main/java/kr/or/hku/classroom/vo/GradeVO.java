package kr.or.hku.classroom.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GradeVO {
	private String lecapNo 	; 	// 과목신청번호
	private String stdNo	;	// 학번
	private String stdNm	;	// 학생명
	private String deptNm	;	// 학과
	private String attendScr; 	// 출석점수 
	private String assignScr;   // 과제점수
	private String testNo	;   // 시험번호
	private String testSe	; 	// 시험구분
	private int middleScr	;	// 중간점수
	private int finalScr	;	// 기말점수
	private String testScr 	; 	// 시험성적
	private String confirmYn;  	// 성적확정여부
	private String crsScr 	;	// 수강과목점수
	private String crsGrd 	;	// 수강과목점수
	private String crsEarnedCrd;// 수강과목학점
	private String totalScr;	// 총점
	private int lecpgMdTest; //중간고사
	private int lecpgFnTest; // 기말고사
	
		
}
