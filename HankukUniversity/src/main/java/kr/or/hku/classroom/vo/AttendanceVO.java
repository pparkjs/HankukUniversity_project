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
public class AttendanceVO {
	// 출석 & 출석 이의신청
	private int atdcNo;				// 출석번호
	private String lecapNo;			// 과목신청번호
	private String stdNo;			// 학번
	private String atdcYnCd;		// 출석여부
	private String atdcWeek;		// 주차 
	private String atdcDmrRsn;		// 결석사유
	private String stdcDmrSttsCd;	// 상태코드
	private String stdNm;			// 학생이름
	private String deptNm;			// 힉과명
	private String proNo; 			// 교번
	private String stdProfilePath;	// 프로필
	
	// 이의신청 파일첨부
	private int atchFileNo;		// 파일첨부번호
	private MultipartFile attendanceFile; // 등록할 때 필요 
	private List<AttachFileVO> fileList;  // 교수가 파일 확인할 때 필요 
}
