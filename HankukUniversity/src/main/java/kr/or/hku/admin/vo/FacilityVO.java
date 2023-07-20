package kr.or.hku.admin.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FacilityVO {
	
	private String flctNo      ;
	private String flctNm      ;
	private String flctClsfCd  ;
	
	private String flctClsfNm  ;
	
	// 조인한 필드
	private int floor;
	
}
