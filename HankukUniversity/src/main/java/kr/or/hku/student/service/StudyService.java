package kr.or.hku.student.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.notice.vo.PaginationInfoVO;
import kr.or.hku.student.vo.StdCalendarVO;
import kr.or.hku.student.vo.StudyVO;

public interface StudyService {
	// 스터디리스트
	public List<StudyVO> studyList(String stdNo);
	// 스터디 인원수
	public int getMemberCount(int studyNo);
	// 가입 대기중인 스터디리스트
	public List<StudyVO> waitStudy(String stdNo);
	// 스터디상세보기
	public StudyVO studyRoom(int studyNo);
	// 스터디 멤버 조회
	public List<StudyVO> studyMem(int studyNo);
	// 가입신청 대기중인 멤버들
	public List<StudyVO> applicationsList(int studyNo);
	// 안읽은 메세지 개수
	public List<Integer> getUnreadCntByUser(StudyVO studyVo);
	//방안에서 해당 메시지 읽음 카운트 -1 처리
	public void readMessageInRoom(StudyVO studyVo);
	//해당 채팅방의 메세지 리스트
	public List<StudyVO> messageList(int studyNo);
	
	public void readChatMessage(StudyVO studyVo);
	// 메세지 등록
	public int insertMessage(StudyVO studyVo);
	// 스터디원 시간표 조회
	public List<StudyVO> scheduleList(StudyVO studyVo);
	// 가입신청 상세보기
	public StudyVO applDetail(StudyVO studyVo);
	// 스터디 생성
	public void addStudy(StudyVO studyVo);
	// 스터디 삭제
	public void delStudy(int studyNo);
	public int delStudyMem(int studyNo);
	// 스터디 가입신청
	public int intoStudy(StudyVO studyVo);
	// 스터디 가입신청 승인/반려
	public int assignStudy(int joinNo);
	public int rejStudy(int joinNo);
	// 스터디 탈퇴
	public int exitStudy(StudyVO studyVo);
	// 스터디 게시판 리스트
	public List<StudyVO> studyBoardList();
	// 총 게시글 개수
	public int boardCount(PaginationInfoVO<StudyVO> pagingVO);
	// 검색된 게시글
	public List<StudyVO> boardSelect(PaginationInfoVO<StudyVO> pagingVO);
	// 본인이 스터디장으로 있는 스터디 목록
	public List<StudyVO> myStudy(String stdNo);
	// 스터디 게시판 글작성
	public int insertStudyBoard(StudyVO studyVo);
	// 스터디 게시글 상세보기
	public StudyVO studyBoardDetail(int stboNo);
	// 스터디 게시글 삭제
	public int deleteStudyBoard(int stboNo);
	// 스터디 게시글 수정
	public int modifyStudyBoard(StudyVO studyVo);
	// 스터디 게시글 조회수
	public int studyBoHit(int stboNo);
	
	// 캘린더 가져오기
	public List<StdCalendarVO> getStdCalList(Map<String, String> map);
	public int updateStdCalList(StdCalendarVO stdCalendarVO);
	public int addStdCalList(StdCalendarVO stdCalendarVO);
	public int deleteStdCalendar(Map<String, String> map);
	
	
	
}
