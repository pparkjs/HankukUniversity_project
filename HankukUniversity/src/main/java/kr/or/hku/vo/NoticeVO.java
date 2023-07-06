package kr.or.hku.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	private String noticeNo; 
	private String noticeTtl;
	private String noticeCn;
	private String noticeWrtrNm;
	private String noticeRegdate;
	private String noticeReadCnt;
	private String noticeClsf;
	private String atchFileNo;
}
