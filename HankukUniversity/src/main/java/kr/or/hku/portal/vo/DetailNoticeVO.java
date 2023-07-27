package kr.or.hku.portal.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.common.vo.AttachFileVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DetailNoticeVO {
	private int noticeNo; 
	private String noticeTtl;
	private String deptCd;
	private String noticeCn;
	private String noticeWrtrNm;
	private String noticeRegdate;
	private int noticeReadCnt;
	private String noticeClsf;
	private int atchFileNo;
	private List<MultipartFile> files;
	private List<AttachFileVO> fileList;
}
