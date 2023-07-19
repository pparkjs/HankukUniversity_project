package kr.or.hku.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.admin.vo.StudentVO;
import kr.or.hku.admin.vo.SubjectCancelVO;

public interface ClassCancelledService {
	public List<SubjectCancelVO> getClassCancelledList();
	public List<StudentVO> getStdInLecture(Map<String, String> map);
}
