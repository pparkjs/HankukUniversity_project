package kr.or.hku.classroom.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class TestVO {
	
	private String testNo          ; // 시험출제번호
	private String lecapNo         ; // 과목신청번호
	private String testSe          ; // 시험 구분
	private String testBgngYmd     ; // 시험 일자
	private int testTimeLimit   ; // 제한시간 (초)
	private String testRegdate     ; // 출제일
	private String testFile        ; // 시험지 파일
	
	private MultipartFile pdfFile; // pdf파일 객체
	private List<TestAnswerVO> answerList; // 시험답안 리스트
	
	private int hours;
	private int minutes;
	private int seconds;
	
	// 조인해서 가져올 필드
	private String stdNo;
	private int lecapSem;
	private String lecapYr;
	private String subNm;
	private int subGrade;
	
	// 응시번호
	private int ttNo;
	private String ttDt;
	private int ttScr;
	
	private String proNo; //교번
}
