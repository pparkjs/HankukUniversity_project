package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentVO {

	private String stdNo          ; //학번
	private String deptCd         ; //학과구분코드
	private String stdNm          ; //학생이름
	private int stdMjrCrd    	  ; //전공학점
	private int stdCtrlCrd   	  ; //교양학점
	private String stdMtcltnYr    ; //입학년도
	private String stdSttsCd      ; //학적상태코드
	private String stdTelno       ; //학생연락처
	private String stdSexCd       ; //성별코드
	private String stdZip         ; //학생우편번호
	private String stdAddr        ; //학생기본주소
	private String stdDaddr       ; //학생상세주소
	private String stdMail        ; //학생이메일
	private String stdBrdt        ; //학생생년월일
	private String stdRrno        ; //학생주민번호
	private String bankCd         ; //학생은행코드
	private String stdActno       ; //학생계좌번호
	private String stdProfilePath ; //프로필사진경로
	
}
