package kr.or.hku.admin.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AcademicChangeVO {
	private long changeNo;
	private String stdNo;
	private String stdNm;
	private String changeTypeCd;
	private String changeTypeNm;
	private String changeRsn;
	private String changeAplyDt;
	private String changeStartYr;
	private String changeStartSem;
	private String changeEndYr;
	private String changeEndSem;
	private String aprvSttsCd;
	private String changeRjctRsn;
}
