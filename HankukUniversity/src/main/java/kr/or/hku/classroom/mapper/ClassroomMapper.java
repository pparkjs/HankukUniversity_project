package kr.or.hku.classroom.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.AttendanceVO;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;

@Mapper
public interface ClassroomMapper {
	
	//---------------------교수 ---------------------//
	// 교수 클래스룸 목록
	public List<LectureAplyVO> proSelectList(String proNo);
	// 교수 클래스룸 메인 과제 리스트
	public List<AssignmentVO> getAssignList(String lecapNo);
	
	
	
	//---------------------학생 ---------------------//
	// 학생 클래스룸 목록
	public List<ClassroomVO> stdSelectList(String stdNo); 
	// 학생 클래스룸 메인 과제 리스트 
	public List<AssignmentVO> stdMainAssignList(Map<String, String> map);
	// 학생 클래스룸 메인 출석현황
	public List<AttendanceVO> getMyAttendance(Map<String, String> map);
	
	// 과목명 가져오기 
	public String getSubNm(String lecapNo);
	
	
}
