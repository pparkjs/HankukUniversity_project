package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RecordVO {
	// 학적변동신청 테이블 ACADEMIC_CHANGE
	private int changeNo; //변동신청 번호
	private String stdNo; //학번

	private String changeTypeCd; // 변동종류 코드
	private String changeRsn; // 변동사유
	private String changeAplyDt; // 변동 신청일
	private String changeStartYr; // 시작년도

	private String changeStartSem; // 시작학기
	private String changeEndYr; // 끝 년도
	private String changeEndSem; // 끝 학기
	private String aprvSttsCd; // 결재 상태코드
	private String changeRjctRsn; // 반려사유

	private String comCd;
	private String comCdNm; 
	private String comCdNm1; // b.com_cd_nm
	private String comCdNm2; // c.com_cd_nm
	
	public int no; // 변동내역순서
}
