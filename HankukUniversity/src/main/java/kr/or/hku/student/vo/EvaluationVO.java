package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EvaluationVO {
	
	private String stdNo              ; //학번
	private String lecapNo            ; //개설신청번호
	private String lecevAns1          ; //문항1답
	private String lecevAns2          ;//문항2답
	private String lecevAns3          ;//문항3답
	private String lecevAns4          ;//문항4답
	private String lecevAns5          ;//문항5답
	private String lecevOverallOpinion;//종합의견답
	
	
	

}
