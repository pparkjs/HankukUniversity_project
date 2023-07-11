package kr.or.hku.lectureInfo.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LectureAplyVO {
	private int lecapNo; // 과목신청번호
	private String subNo; // 과목코드
	private String proNo; //교번
	private String flctsNo; // 시설물번혼
	private String lecapYr; //개설년도
	private int lecapTgGrade; //대상학년
	private String lecapDt; // 신청일
	private String lecapCpct; //수강정원
	private int lecapSem; // 개설학기
	private String aprvSttsCd; //결재상태코드
	private String lecapRjctRsn; //반려사유
	private String avlCd1; //가용코드
	
	// lecture_aply 테이블 이외에  join해서 가져올 필요한 필드
	private String subNm; //과목이름
	private String comCdNm; //이수구분이름
	private String proNm; //교수이름
	private String lecscDay; //강의요일
	private int periodCd; //시작교시
	private int lecscHour; // 시수
	
	private String lecpgIntro; //강의소개
	private String lecpgLggCd; //언어구분
	private String avlCd2; //대면/비대면 여부
	private int lecpgAtd;  //출석
	private int lecpgHw; // 과제
	private int lecpgMdTest; //중간고사
	private int lecpgFnTest; // 기말고사
	private String lecpgBook; //주교재
	private String week1    ;
	private String week2    ;
	private String week3    ;
	private String week4    ;
	private String week5    ;
	private String week6    ;
	private String week7    ;
	private String week8    ;
	private String week9    ;
	private String week10   ;
	private String week11   ;
	private String week12   ;
	private String week13   ;
	private String week14   ;
	private String week15   ;
	
	
}
