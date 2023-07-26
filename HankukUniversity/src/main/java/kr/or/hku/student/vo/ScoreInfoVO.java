package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 성적증명서를 위한 VO by KYW
@Getter
@Setter
@ToString
public class ScoreInfoVO {
	private String stdNo;
	private String lecapYrsem;
	private String subNo;
	private String subNm;
	private String courseClsf;
	private String lecapNo;
	private String crsEarnedCrd;
	private String crsScr;
}
