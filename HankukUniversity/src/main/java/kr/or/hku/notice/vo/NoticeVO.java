package kr.or.hku.notice.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	private List<MultipartFile> previewFile;
}
