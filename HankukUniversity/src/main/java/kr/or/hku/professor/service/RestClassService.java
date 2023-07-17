package kr.or.hku.professor.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.ServiceResult;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.LectureTimeTableVO;

public interface RestClassService {

	public List<LectureTimeTableVO> getMyTimetable(String proNo);

	public LectureTimeTableVO setRestTable(Map<String,String> myMap);

	public ServiceResult insertRestTable(Map<String, String> myMap);

	public int ifSameData(Map<String, String> myMap);

	public int deleteRestTable(String subclNo);

}
