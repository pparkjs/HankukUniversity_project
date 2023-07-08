package kr.or.hku.service.student;

import java.util.List;
import java.util.Map;

import kr.or.hku.vo.DepartmentVO;
import kr.or.hku.vo.LectureAplyVO;
import kr.or.hku.vo.SubjectVO;

public interface ICourseInfoService {
	public List<SubjectVO> getList(Map<String, Object> map);
	public List<DepartmentVO> getAllDept();
	public List<LectureAplyVO> getLecture(String status);
}
