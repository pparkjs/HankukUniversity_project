package kr.or.hku.classroom.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.classroom.mapper.ClassroomMapper;
import kr.or.hku.classroom.service.ClassroomService;
import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.AttendanceVO;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;

@Service
public class ClassroomServiceImpl implements ClassroomService {
	
	@Autowired
	private ClassroomMapper classroomMapper;
	
	// 교수 클래스룸 목록
	@Override
	public List<LectureAplyVO> proSelectList(String proNo) {
		return classroomMapper.proSelectList(proNo);
	}
	
	// 교수 클래스룸 메인 과제 리스트
	@Override
	public List<AssignmentVO> getAssignList(String lecapNo) {
		return classroomMapper.getAssignList(lecapNo);
	}
	
	// 학생 클래스룸 목록
	@Override
	public List<ClassroomVO> stdSelectList(String stdNo) {
		return classroomMapper.stdSelectList(stdNo);
	}
	
	// 과목명 가져오기 
	@Override
	public String getSubNm(String lecapNo) {
		return classroomMapper.getSubNm(lecapNo);
	}
	
	// 학생 클래스룸 메인 과제 리스트
	@Override
	public List<AssignmentVO> stdMainAssignList(Map<String, String> map) {
		return classroomMapper.stdMainAssignList(map);
	}
	
	// 클래스룸 메인 출석 현황
	@Override
	public List<AttendanceVO> getMyAttendance(Map<String, String> map) {
		return classroomMapper.getMyAttendance(map);
	}

}
