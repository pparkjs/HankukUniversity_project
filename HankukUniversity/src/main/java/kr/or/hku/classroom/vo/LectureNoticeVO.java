package kr.or.hku.classroom.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LectureNoticeVO {
	private int lecntNo;
	private String lecapNo;
	private String lecntTtl;
	private String lecntCn;
	private String lecntRegdate;
	private String lecntWriter;
	private int lecntReadCnt;
	private String atchFileNo;
	
}
