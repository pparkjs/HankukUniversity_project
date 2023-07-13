package kr.or.hku.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.student.vo.StudyVO;
@Mapper
public interface StudyMapper {
	
	// 스터디리스트
	public List<StudyVO> studyList();
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
	// 스터디 생성
	public void addStudy(StudyVO studyVo);
	// 스터디 삭제
	public int delStudy(int studyNo);
	public int delStudyMem(int studyNo);
	// 스터디 가입신청
	public int intoStudy(StudyVO studyVo);
	// 스터디 가입신청 승인/반려
	public int assignStudy(int joinNo);
	public int rejStudy(int joinNo);
	// 스터디 탈퇴
	public int exitStudy(StudyVO studyVo);
	
}
