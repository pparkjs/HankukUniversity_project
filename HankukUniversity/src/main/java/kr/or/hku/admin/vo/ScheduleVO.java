package kr.or.hku.admin.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleVO {
	private int lecapNo;
	private String lecscDay;
	private String periodCd;
	private String lecscHour;
}
