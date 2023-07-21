package kr.or.hku.classroom.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.AttendanceVO;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;

public interface ClassroomService {
		
	//---------------------교수 ---------------------//
	// 교수 클래스룸 목록
	public List<LectureAplyVO> proSelectList(String proNo);
	// 교수 클래스룸 메인 과제 리스트
	public List<AssignmentVO> getAssignList(String lecapNo);
	
	
	
	//---------------------학생 ---------------------//
	// 교수 클래스룸 목록
	public List<ClassroomVO> stdSelectList(String stdNo); 
	// 학생 클래스룸 메인 과제 리스트 
	public List<AssignmentVO> stdMainAssignList(String lecapNo);
	// 학생 클래스룸 메인 출석현황
	public List<AttendanceVO> getMyAttendance(Map<String, String> map);
	
	
	// 과목명 가져오기 
	public String getSubNm(String lecapNo);
	
}
