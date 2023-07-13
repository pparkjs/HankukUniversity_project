package kr.or.hku.classroom.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AssignmentVO {
	
	private String asmNo        ;	// 과제번호
	private String lecapNo      ;	// 과목신청번호
	private String asmWeek      ;	// 주차
	private String asmTtl       ;	// 과제제목
	private String asmCn        ;	// 과제내용
	private String asmProNm    	;	// 교수명
	private String asmRegdate   ;	// 과제등록일
	private String atchFileNo  	;	// 첨부파일번호
	private String asmsbNo		;	// 과제제출번호
	private String asmsbDt		;	// 제출일자
	private String asmsbScr		;	// 과제점수
	private String avlCode		;	// 가용코드
	private String proNm		;	// 교수이름
	private String proNo		;	// 교수번호
	private String stdNo		;	// 학생번호	
	private int alarmNo			;	// 알람번호
	private String userNo		;	// 사용자번호	
    
}
