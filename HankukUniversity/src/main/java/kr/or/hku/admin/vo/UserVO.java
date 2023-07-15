package kr.or.hku.admin.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	private String userNo;
	private String userPw;
	private String userClsCd;
	private String enabled;

	private String userClsNm;	// 사용자 구분 이름
	
	// 공통
	private String userAuth;
	private String deptCd;
	private String deptNm;
	private String bankCd;
	private String bankNm;
	private String sexCd;
	private String sexNm;
	private MultipartFile profile;
	
	private String userNm;
	private String userTelno;
//	private String userSexCd;
	private String userZip;
	private String userAddr;
	private String userDaddr;
	private String userMail;
	private String userBrdt;
	private String userRrno;
	private String userActno;
	private String profilePath;
	
	// 학생
	private String stdMjrCrd;
	private String stdCtrlCrd;
	private String stdMtcltnYr;
	private String stdSttsCd;
	private String stdSttsNm;
	
	// 교수
//	private String proNo;
	private String proJbttlCd;
	private String proJbttlNm;
	private String proJncmpYmd;
	private String proRsgntnYmd;
	private String proLab;
	private String proLabTelno;
//	private String proNm;
//	private String proTelno;
//	private String proZip;
//	private String proAddr;
//	private String proDaddr;
//	private String proMail;
//	private String proBrdt;
//	private String proRrno;
//	private String proActno;
//	private String proProfilePath;
	
	// 교직원
//	private String empNo;
//	private String empName;
//	private String empMail;
//	private String empBrdt;
	private String empJncmpYmd;
	private String empRsgntnYmd;
//	private String empTelno;
//	private String empZip;
//	private String empAddr;
//	private String empDaddr;
//	private String empRrno;
//	private String empActno;
//	private String empProfilePath;
	private String empDeptCd;
	private String empDeptNm;
	private String empJbttlCd;
	private String empJbttlNm;
	private String empJbgdCd;
	private String empJbgdNm;

}
