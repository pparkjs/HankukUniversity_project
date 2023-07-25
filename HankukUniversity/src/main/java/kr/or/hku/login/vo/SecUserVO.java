package kr.or.hku.login.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.admin.vo.EmployeeVO;
import kr.or.hku.admin.vo.userAuthVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class SecUserVO {

		private String userNo;
		private String userPw;
		private String userClsCd;
		private String enabled;
		private String userFirstLogin;
		private String userClsNm;	// 사용자 구분 이름
		
		// 공통
		private List<userAuthVO> userAuthList;
		private String deptCd;
		private String deptNm;
		private String bankNm;
		private String sexCd;
		private String sexNm;
		private MultipartFile profile;
		
		private String userNm;
		private String userTelno;
		private String userSexCd;
		private String userZip;
		private String userAddr;
		private String userDaddr;
		private String userMail;
		private String userBrdt;
		private String userRrno;
		private String userActno;
		private String profilePath;
//		
		private StudentVO studentVO;
		private EmployeeVO employeeVO;
		private ProfessorVO professorVO;
		
//		// 학생
//		private String stdNo;
//		private String stdNm;
//		private String stdMjrCrd;
//		private String stdCtrlCrd;
//		private String stdMtcltnYr;
//		private String stdSttsCd;
//		private String stdSttsNm;
//		private String stdTelNo;
//		private String stdActno;
//		private String stdSexCd;
//		private String stdZip;
//		private String stdAddr;
//		private String stdDaddr;
//		private String stdMail;
//		private String stdBrdt;
//		private String stdRrno;
//		private String bankCd;
//		private String stdSctno;
//		private String stdProfilePath;
//		
//		
//		
//		// 교수
//		private String proNo;
//		private String proJbttlCd;
//		private String proJbttlNm;
//		private String proJncmpYmd;
//		private String proRsgntnYmd;
//		private String proLab;
//		private String proLabTelno;
//		private String proNm;
//		private String proTelno;
//		private String proZip;
//		private String proAddr;
//		private String proDaddr;
//		private String proMail;
//		private String proBrdt;
//		private String proRrno;
//		private String proActno;
//		private String proProfilePath;
//		
//		// 교직원
//		private String empNo;
//		private String empName;
//		private String empMail;
//		private String empBrdt;
//		private String empJncmpYmd;
//		private String empRsgntnYmd;
//		private String empTelno;
//		private String empZip;
//		private String empAddr;
//		private String empDaddr;
//		private String empRrno;
//		private String empActno;
//		private String empProfilePath;
//		private String empDeptCd;
//		private String empDeptNm;
//		private String empJbttlCd;
//		private String empJbttlNm;
//		private String empJbgdCd;
//		private String empJbgdNm;

	}


