package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class StudentInfoVO {
	private String stdNo          ; //학번
	private String stdNm          ; //학생이름
	private String subCrd		 ;//학점
	private int stdMjrCrd    	  ; //전공학점
	private int stdCtrlCrd   	  ; //교양학점
	
	// 조인해서 가져올 필드
	private String deptNm; //학과이름
	private String colNm; //단과이름
	private String stdSttsNm; // 학적상태
	private String crsClassfNm; //이수구분코드
}
