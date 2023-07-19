package kr.or.hku.classroom.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.common.vo.AttachFileVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LectureNoticeVO {
	private int lecntNo;
	private String lecapNo;
	private String lecntTtl;
	private String lecntCn;
	private String lecntRegdate;
	private String lecntWriter;
	private int lecntReadCnt;
	private int atchFileNo;
	
	// 폼에서 데이터 전송했을떄 name이랑 이 필드명이랑 동일해야 여기로 매핑이 된다.
	private List<MultipartFile> attchNotice;
	
	// 이거는 데이터베이스에서 통합첨부파일을 가져올떄 사용하는 필드이다.
	private List<AttachFileVO> fileList;
}
