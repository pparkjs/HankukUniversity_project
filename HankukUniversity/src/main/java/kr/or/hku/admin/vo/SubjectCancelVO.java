package kr.or.hku.admin.vo;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class SubjectCancelVO {
	private long subclNo;
	private String lecapNo;
	private String subNm;
	private String proNo;
	private String proNm;
	private String sunclRsn;
	private String subclAplyDt;
	private String subclAplyWk;
}
