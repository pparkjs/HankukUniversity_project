package kr.or.hku.counseling.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CounselingRsvtVO {
	private int dscsnNo; //상담신청번호
	private String stdNo; //학번
	private String proNo; //교번
	private String dscsnRsn; //상담신청사유
	private String dscsnAplyDt; //상담신청일시
	private String periodCd; //교시코드
	private String attendModeCd; // 참석방식코드
	private String aprvSttsCd; //결재상태코드
	private String rejCon; //반려사유
	
	private String stdNm; //신청자 이름
	private String proNm; //교수이름
}
