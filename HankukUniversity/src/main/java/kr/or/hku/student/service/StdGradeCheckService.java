package kr.or.hku.student.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.ServiceResult;
import kr.or.hku.lectureInfo.vo.CourseRegistVO;
import kr.or.hku.student.vo.DepartmentCrtrVO;
import kr.or.hku.student.vo.EvaluationVO;
import kr.or.hku.student.vo.StudentInfoVO;

public interface StdGradeCheckService {


	public Map<String, List<?>> getGradeInfo(String stdNo);

	public ServiceResult submitobjections(CourseRegistVO courseVO);

	public ServiceResult insertEvaluation(EvaluationVO evalVO);

	public Map<String, List<?>> getAllGradeInfo(String stdNo);

	public DepartmentCrtrVO getDeptCrtr(String deptCd);

	public List<CourseRegistVO> getAllgrade(Map<String, String> mymap);


}
