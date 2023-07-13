package kr.or.hku.classroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;

@Mapper
public interface ClassroomListMapper {

	public List<ClassroomVO> selectList(String stdNo); 
	public List<LectureAplyVO> proSelectList(String proNo); 
	
}
