package kr.or.hku.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.student.vo.PaginationInfoVO;
import kr.or.hku.student.vo.StdCalendarVO;
import kr.or.hku.student.vo.StudyVO;
@Mapper
public interface StudyMapper {
	
	// 스터디리스트
	public List<StudyVO> studyList(String stdNo);
	// 가입 대기중인 스터디리스트
	public List<StudyVO> waitStudy(String stdNo);
	// 가입신청 대기준인지 검사
	public List<StudyVO> joinCheck(StudyVO studyVo);
	// 스터디상세보기
	public StudyVO studyRoom(int studyNo);
	// 스터디 멤버 조회
	public List<StudyVO> studyMem(int studyNo);
	// 가입신청 대기중인 멤버들
	public List<StudyVO> applicationsList(int studyNo);
	// 스터디원 시간표 조회
	public List<StudyVO> scheduleList(StudyVO studyVo);
	// 가입신청 상세보기
	public StudyVO applDetail(StudyVO studyVo);
	
	public StudyVO getFilePath(String stdNo);
	// 스터디 생성
	public int addStudy(StudyVO studyVo);
	// 스터디생성될때 스터디장 등록
	public void insertStudyLeader(Map<String, Object> map);
	//스터디장인지 확인
	public String selectRole(StudyVO studyVo);
	// 스터디 삭제
	public int delStudy(int studyNo);
	public int delStudyMem(int studyNo);
	// 스터디 가입신청
	public int intoStudy(StudyVO studyVo);
	// 스터디 가입신청 승인/반려
	public int assignStudy(int joinNo);
	public int rejStudy(int joinNo);
	// 가입신청 당한놈 찾기
	public StudyVO selectAssignMem(int joinNo);
	// 가입신청 승인시 스터디멤버로 추가
	public int insertStudyMem(StudyVO studyVo);
	// 스터디 탈퇴
	public int exitStudy(StudyVO studyVo);
	// 안읽은 메세지 개수
	public List<Integer> getUnreadCntByUser(StudyVO studyVo);
	// 메세지 등록
	public int insertMessage(StudyVO studyVo);
	// 안읽은 멤버들 등록
	public void insertUnreadMember(Map<String, Object> map);
	//나를 제외한 해당 방에 속한 사람들 안읽은 메시지 개수 업데이트
	public void updateMessageCountExceptMe(StudyVO studyVo);
	public List<StudyVO> getStudyMember(int studyNo);
	
	public int addUnreadMem(StudyVO studyVo);
	
	public void readChatMessage(StudyVO studyVo);
	//방안에서 해당 메시지 읽음 카운트 -1 처리
	public void readMessageInRoom(StudyVO studyVo);
	// 안읽은 메세지 테이블에서 읽은놈 삭제
	public void deleteUnreadMsg(StudyVO studyVo);
	//해당 채팅방의 메세지 리스트
	public List<StudyVO> messageList(int studyNo);
	// 본인이 스터디장으로 있는 스터디 목록
	public List<StudyVO> myStudy(String stdNo);
	
	
	// 스터디 게시판	
	
	// 스터디 게시판 리스트
	public List<StudyVO> studyBoardList();
	
	public List<StudyVO> studyBoardList2(Map<String, String> map);
	// 검색된 게시글 
	public List<StudyVO> boardSelect(PaginationInfoVO<StudyVO> pagingVO);
	// 총 게시글 개수
	public int boardCount(PaginationInfoVO<StudyVO> pagingVO);	
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
	
		
	// 스터디 인원수
	public int getMemberCount(int studyNo);	
	// 캘린더 가져오기
	public List<StdCalendarVO> getStdCalList(Map<String, String> map);
	public int updateStdCalList(StdCalendarVO stdCalendarVO);
	public int addStdCalList(StdCalendarVO stdCalendarVO);
	public int deleteStdCalendar(Map<String, String> map);
}
