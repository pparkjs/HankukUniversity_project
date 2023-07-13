package kr.or.hku.classroom.service;

import java.util.List;

import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;

public interface ClassroomListService {
	
	public List<ClassroomVO> selectList(String stdNo); 
	public List<LectureAplyVO> proSelectList(String proNo); 
}
