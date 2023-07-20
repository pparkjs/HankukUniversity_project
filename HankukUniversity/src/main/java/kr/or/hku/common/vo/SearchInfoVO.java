package kr.or.hku.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchInfoVO {
	// 간단한 검색폼을 위한 속성들
	private String searchType;
	private String searchWord;
	
	// 교과목 조회 할때 쓰임 by KYW
	private String comCdNm;
	private String deptNm;
	private String subGrade;
	private String subNm;
	
	// 사물함 조회 할때 쓰임 by KYW
	private String flctNo;
	private String floor;
	private String avlCd;
	
	// 사물함 예약 조회
	private String lockerYr;
	private String rsvtSem;
	private String stdNo;
}
