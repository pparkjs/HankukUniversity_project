package kr.or.hku.lectureInfo.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;

public interface ICourseInfoService {
	public List<SubjectVO> getList(Map<String, Object> map);
	public List<DepartmentVO> getAllDept();
	public List<LectureAplyVO> getLecture(String status);
}
