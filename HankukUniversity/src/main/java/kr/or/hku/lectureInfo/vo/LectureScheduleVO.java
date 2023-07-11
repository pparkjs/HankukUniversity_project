package kr.or.hku.lectureInfo.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class LectureScheduleVO {
	private String lecapNo;
	private String lecscDay;
	private int periodCd;
	private int lecscHour;
}
