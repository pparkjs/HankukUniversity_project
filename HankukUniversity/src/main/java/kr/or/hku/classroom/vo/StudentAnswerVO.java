package kr.or.hku.classroom.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentAnswerVO {
	private int ttNo;   // 응시번호
	private String testNo;  // 시험번호
	private String lecapNo; //과목신청번호
	private int staNo; // 문제번호
	private String staAns; //제출 답
}
