package kr.or.hku.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttachFileVO {
	private int atchFileNo ;
	private int atchFileSeq;
	private String bizType;
	private String filePath;
	private String fileOrgnlFileNm;
	private String fileSize;
	private String fileContType;
	private int fileDownCnt; 
}
