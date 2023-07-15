package kr.or.hku.classroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;

@Mapper
public interface ClassroomMapper {
	
//  클래스룸 리스트 출력
	public List<ClassroomVO> selectList(String stdNo); 
	public List<LectureAplyVO> proSelectList(String proNo);
	public List<AssignmentVO> getClassList(int lecapNo); 
	
// 클래스룸 메인 
	
	
}
