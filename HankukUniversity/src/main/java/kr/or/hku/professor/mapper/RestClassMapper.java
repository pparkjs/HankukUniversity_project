package kr.or.hku.professor.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.lectureInfo.vo.LectureTimeTableVO;
@Mapper
public interface RestClassMapper {

	public List<LectureTimeTableVO> getMyTimetable(String proNo);

	public LectureTimeTableVO setRestTable(Map<String,String> myMap);

	public int insertRestTable(Map<String, String> myMap);

}
