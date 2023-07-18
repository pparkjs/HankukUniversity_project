package kr.or.hku.classroom.service;

import java.util.List;

import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;

public interface ClassroomService {
	
	public List<ClassroomVO> selectList(String stdNo); 
	
	public List<LectureAplyVO> proSelectList(String proNo);
	
	public List<AssignmentVO> getAssignList(String lecapNo); 
}
