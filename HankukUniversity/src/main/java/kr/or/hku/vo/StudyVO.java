package kr.or.hku.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudyVO {
	public int studyNo; //스터디 그룹 번호
	public String stdNo;
	public String studyName;
	public String studyRegdate; // 생성일
	public int studyCpcy; //스터디 정원
	public String studyIntro;
	
	public int joinNo; // 신청번호
	public String aprvSttsCd; //결재상태코드
	public String joinRegdate; //신청일 
	public String joinReason; //신청사유
	
	public String studyRole; //역할
	
	//스터디 게시판
	public int stbo_no;
	public String stbo_title;
	public String stbo_content;
	public String stbo_writer;
	public String stbo_regdate; //작성일
	public int stbo_read_cnt; //조회수
	
	// 채팅방
	public int unreadMsgCnt; //안읽은 메세지 개수
	public int msgNo; // 메세지 번호
	public String msgContent; 
	public String msgRegdate; //메세지 등록일
	public int unreadMemCnt; // 안읽은 멤버 수
	public String unreadMem; // 안읽은 멤버
	
	//스터디 일정
	public int calNo; // 일정번호
	public String calTtl; // 일정제목
	public String calCn; // 일정내용
	public String calBgngDt; //시작날짜
	public String calEndDt; // 끝 날짜
	public String calColor; // 색
}
