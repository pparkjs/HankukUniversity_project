package kr.or.hku.classroom.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TestResultVO {
	private String testDate; // 시험일자
	private String takeDate; // 응시일자
	private int taTotal; // 총 문제수
	private int wrongCnt; // 틀린개수
	private int answerCnt; // 맞은개수
	private int examTotalScore; // 총점
	private int myScore; //나의점수
}
