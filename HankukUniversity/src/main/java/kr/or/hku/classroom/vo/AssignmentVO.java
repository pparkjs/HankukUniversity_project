package kr.or.hku.classroom.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.common.vo.AttachFileVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AssignmentVO {
	// 과제 & 과제 제출
	private String asmNo        ;	// 과제번호
	private String lecapNo      ;	// 과목신청번호
	private String asmWeek      ;	// 주차
	private String asmTtl       ;	// 과제제목
	private String asmCn        ;	// 과제내용
	private String asmProNm    	;	// 교수명
	private String asmRegdate   ;	// 과제등록일
	private int atchFileNo  	;	// 첨부파일번호
	private String asmsbNo		;	// 과제제출번호
	private String asmsbDt		;	// 제출일자
	private String asmsbScr		;	// 과제점수
	private String avlCode		;	// 가용코드
	private String proNm		;	// 교수이름
	private String proNo		;	// 교수번호
	private String stdNo		;	// 학생번호	
	private String subNm		;	// 과목명
	private String stdNm		;	// 학생이름
	private String deptNm		;	// 학과이름
	
//	과제를 제출 했을때 받는 필드
	private MultipartFile assignFile;
	
	// 파일 정보들
	private List<AttachFileVO> fileList;
	
//	// 알람테이블 조인
//	private int alarmNo			;	// 알람번호
//	private String userNo		;	// 사용자번호
//	private String alarmType	;	// 알람타입
//	private String alarmTtl		;	// 알람제목
//	private String alarmRegDt	;	// 알람등록일
//	private String alarmPathNo	; 	// 알람경로번호

}
