package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class LockerRsvtVO {
	private int lockerRsvtNo; // 사물함 예약번호
	private int lockerNo; //사물함 번호
	private int floor; //층
	private String flctNo; //시설번호
	private String stdNo;	//학번
	private String lockerYr;	// 신청년도
	private int rsvtSem;  // 신청학기
	private String avlCd;	// 열쇠불출여부
	
	private String presentCheck; //현재 년도 현재 학기인지 체크
	private String flctNm;
	private String stdNm;
}
