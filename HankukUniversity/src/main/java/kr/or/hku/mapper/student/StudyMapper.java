package kr.or.hku.mapper.student;

import java.util.List;

import kr.or.hku.vo.StudyVO;

public interface StudyMapper {
	
	// 스터디리스트
	public List<StudyVO> studyList();
	// 스터디상세보기
	public StudyVO studyRoom(int studyNo);
	// 스터디 생성
	public int addStudy(StudyVO studyVo);
	// 스터디 삭제
	public int delStudy(int studyNo);
	// 스터디 가입신청
	public int intoStudy(StudyVO studyVo);
	// 스터디 가입신청 승인/반려
	public int assignStudy(StudyVO studyVo);
	// 스터디 탈퇴
	public int exitStudy(int stdNo);
	
}
