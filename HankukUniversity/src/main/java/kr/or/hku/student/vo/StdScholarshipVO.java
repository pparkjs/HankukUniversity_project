package kr.or.hku.student.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.common.vo.AttachFileVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StdScholarshipVO {
	private String sclsCd;
	private String sclsNm;
	private String sclsAmt;
	private String sclsAplyBgngDt;
	private String sclsAplyEndDt;
	private String sclsTerms;

	private String sclsapNo;
	private String stdNo;
	private String sclsapDt;
	private String sclsapRjctRsn;
	private String aprvSttsCd;
	private String aprvSttsNm;
	private String atchFileNo;
	private String sclsapYr;
	private int sclsapSem;
	
	private List<MultipartFile> aplyFiles;
	private List<AttachFileVO> aplyDetailFiles;
}
