package kr.or.hku.lectureInfo.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecturePlanVO {
	private String lecpgIntro; //강의소개
	private String lecpgLggCd; //언어구분
	private String avlCd; //대면/비대면 여부
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
