package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StdCalendarVO {
	private String calNo;
	private String calTtl;
	private String calCn;
	private String calBgngDt;
	private String calEndDt;
	private String calColor;
	
	private String studyNo;
}
