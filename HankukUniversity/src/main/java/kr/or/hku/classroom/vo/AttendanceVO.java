package kr.or.hku.classroom.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendanceVO {
	// 출석 & 출석 이의신청
	private int atdcNo;				// 출석번호
	private String lecapNo;			// 과목신청번호
	private String stdNo;			// 학번
	private String atdcYnCd;		// 출석여부
	private String atdcWeek;		// 주차 
	private String atdcDmrRsn;		// 결석사유
	private String stdcDmrSttsCd;	// 상태코드
	private String stdNm;			// 학생이름
	private String deptNm;			// 힉과명
	
	// 이의신청 파일첨부
	private String atchFileNo;		// 파일첨부번호
	private String atchFileSeq;		// 파일첨부순서
	private String bizType;			// 업무구분 
	private String filePath;		// 파일경로
	private String fileOrgnlFileNm ;// 원본파일이름
	private String fileSize;		// 파일크기
	private String fileContType;	// 파일유형
	private String fileDownCnt;		// 파일다운로드횟수
}
