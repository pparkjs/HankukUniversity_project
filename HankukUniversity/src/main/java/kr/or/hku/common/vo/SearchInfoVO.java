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
}
