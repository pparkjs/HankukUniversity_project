package kr.or.hku.classroom.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TestAnswerVO {
	private String lecapNo;  // 과목신청번호
	private String testNo; // 시험번호
	private int taNo; //문제 번호
	private String taAns; //답
	private int taScr; //문제 점수
	private int answerCh; // 선지
}
