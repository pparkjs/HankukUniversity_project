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
public class StudyVO {
	private int studyNo; // 스터디 그룹 번호
	private String stdNo;
	private String studyName;
	private String studyRegdate; // 생성일
	private int studyCpcy; // 스터디 정원
	private String studyIntro;

	private int count; // 스터디방 인원수

	// 가입신청
	private int joinNo; // 신청번호
	private String aprvSttsCd; // 결재상태코드
	private String joinRegdate; // 신청일
	private String joinReason; // 신청사유

	private String studyRole; // 역할

	// 스터디 게시판
	private int stboNo;
	private String stboTitle;
	private String stboContent;
	private String stboWriter;
	private String stboRegdate; // 작성일
	private int stboReadCnt; // 조회수
	private int atchFileNo;
	private List<MultipartFile> files;
	private List<AttachFileVO> fileList;

	private int totalRecord;
	
	// 채팅방
	private int unreadMsgCnt; // 안읽은 메세지 개수
	private int msgNo; // 메세지 번호
	private String msgContent;
	private String msgRegdate; // 메세지 등록일
	private int unreadMemCnt; // 안읽은 멤버 수
	private String unreadMem; // 안읽은 멤버
	
	//DB에는 없음 스터디장설정 위한 변수
	private String authRole;
	
	// DB에 없는 필요한 변수
	private String type;

	// 알람
	private int alarmNo;  //알람번호
	private String receiveUserNo; // 수신 사용자번호
	private String alarmType; // 알람타입
	private String alarmTtl; //알람제목
	private String alarmRegDt; //알람등록일
	private String alarmPathNo; //알람경로번호
	private String sendUserNo; // 발신 사용자번호

	// 스터디 일정
	private int calNo; // 일정번호
	private String calTtl; // 일정제목
	private String calCn; // 일정내용
	private String calBgngDt; // 시작날짜
	private String calEndDt; // 끝 날짜
	private String calColor; // 색

	// 조인시 필요
	private String stdNm; // 학생이름
	private String deptCd; // 학과코드
	private String deptNm; // 학과명
	private String stdNo1;
	private String stdNo2;
	private String studyNo1;
	private String studyNo2;
	private String stdProfilePath; //프로필 이미지 경로

	// 시간표리스트
	private String lecapNo; // 과목신청번호
	private String lecscDay; // 요일
	private int periodCd; // 교시
	private int lecscHour; // 시수
	private String lecapYr; // 개설년도
}
