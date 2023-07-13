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
	
	// 공통코드 
	private String comCd; //공통코드
	private String comCdGrp; //공통코드 그룹
	private String comCdNm; // 공통코드명
	private String comCdNm1; // b.com_cd_nm
	private String comCdNm2; // c.com_cd_nm
	
	// 조인해서 가져올 필드
	private String deptNm; //학과이름
	private String stdSttsNm; // 학적상태
	private int grade; //학년
	private String flctNo; // 시설번호
	private String flctNm; // 시설이름
	private int floor;	// 시설 층
	private String currentYear; //현재년도
	private int currentSem; //현재학기
	
}
