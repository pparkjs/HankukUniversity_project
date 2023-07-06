package kr.or.hku.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginVO {
	//UserVO
	private String userNo; //사용자식별번호
	private String userPw; //사용자비밀번호
	private String userClsCd; //사용자구분코드
	private int enabled; //스프링시큐리티

	
	//직원VO
	private String empNo            ;
	private String empName          ;
	private String empMail          ;
	private String empBrdt          ;
	private String empJncmpYmd     ;
	private String empRsgntnYmd    ;
	private String empTelno         ;
	private String sexCd            ;
	private String empZip           ;
	private String empAddr          ;
	private String empDaddr         ;
	private String empRrno          ;
	private String bankCd           ;
	private String empActno         ;
	private String empProfilePath  ;
	private String emDeptCd       ;
	private String empJbttlCd      ;
	
	//교수VO
	private String proNo          ;
	private String deptCd         ;
	private String proJbttlCd    ;
	private String proJncmpYmd   ;
	private String proRsgntnYmd  ;
	private String proLab         ;
	private String proLabTelno   ;
	private String proNm          ;
	private String proTelno       ;
//	private String sexCd          ;
	private String proZip         ;
	private String proAddr        ;
	private String proDaddr       ;
	private String proMail        ;
	private String proBrdt        ;
	private String proRrno        ;
//	private String bankCd         ;
	private String proActno       ;
	private String proProfilePath;
	
	//학생VO
	private String stdNo          ; //학번
//	private String deptCd         ; //학과구분코드
	private String stdNm          ; //학생이름
	private int stdMjrCrd     ; //전공학점
	private int stdCtrlCrd    ;  //교양학점
	private String stdMtcltnYr   ;  //입학년도
	private String stdSttsCd     ;  //학적상태코드
	private String stdTelno       ;  //학생연락처
	private String stdSexCd      ;  // 성별코드
	private String stdZip         ; //학생우편번호
	private String stdAddr        ; //학생기본주소
	private String stdDaddr       ; //학생상세주소
	private String stdMail        ; //학생이메일
	private String stdBrdt        ; //학생생년월일
	private String stdRrno        ; //학생주민번호
//	private String bankCd         ; //학생은행코드
	private String stdActno       ; //학생계좌번호
	private String stdProfilePath; //프로필사진경로
	
}
