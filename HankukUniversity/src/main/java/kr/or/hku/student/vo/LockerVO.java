package kr.or.hku.student.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LockerVO {
	private int lockerNo;
	private int floor;
	private String flctNo;
	private String avlCd;
	
	// 조인시 가져올 필드
	private String flctNm;
}
