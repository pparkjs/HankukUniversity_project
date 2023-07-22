package kr.or.hku.admin.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FacilitiesVO {
	private String flctsNo;
	private String flctNo;
	private String flctsNm;
	
	// 조인해서 가져올 필드
	private String flctNm; //시설이름
	private String flctsRsvtNo; // 시설물예약번호
	private String stdNo;		//예약자 학번
	private String rsvtDate;	//예약날짜
	private String startHours;	//시작날짜
	private String endHours;	//종료날짜
	private int useUsers;	//사용인원
	private String usePrps;	//사용목적
	
	private String stdNm;		//예약자 이름
	
	private int passCheck; // 예약시간이 지났는지 아닌지 체크
	
}
