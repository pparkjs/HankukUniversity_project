package kr.or.hku.admin.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CalendarVO {
	private int calNo;
	private String calTtl;
	private String calCn;
	private String calBgngDt;
	private String calEndDt;
	private String calColor;
	
	/*
	 	기존에 이 컬럼은 학사 인지 학과인지 구분하는거였지만
	 	학과 일정을 띄우려면 학과에 대한 학과 코드가 있어야 해서 
	 	
	 	학사 일정은 공통 코드에 있는 uni 학사 라는걸 명시 해주고 
	 	학과 일정은 학과 컬럼에 있는걸 가져와서 구현 할 예정이다.
	 */
	private String calClsfCd;
}
