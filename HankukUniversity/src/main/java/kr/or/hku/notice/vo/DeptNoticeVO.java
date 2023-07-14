package kr.or.hku.notice.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.common.vo.AttachFileVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeptNoticeVO {
	private int depntNo;
	private String deptCd;
	private String depntTtl;
	private String depntCn;
	private String depntWrtrNm;
	private String depntRegdate;
	private String depntReadCnt;
	private int atchFileNo;
	
	private List<MultipartFile> files;
	private List<AttachFileVO> fileList;
}
