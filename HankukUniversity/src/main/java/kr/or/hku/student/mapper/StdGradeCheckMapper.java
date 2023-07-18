package kr.or.hku.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.lectureInfo.vo.CourseRegistVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;
import kr.or.hku.student.vo.DepartmentCrtrVO;
import kr.or.hku.student.vo.EvaluationVO;
import kr.or.hku.student.vo.StudentInfoVO;

@Mapper
public interface StdGradeCheckMapper {
	public List<StudentInfoVO> getStudentInfo(String stdNo);
	public List<SubjectVO> getSubjectInfo(String stdNo);
	public int submitobjections(CourseRegistVO courseVO);
	public int insertEvaluation(EvaluationVO evalVO);
	public int updateEvaluCd(EvaluationVO evalVO);
	public List<CourseRegistVO> getAllSubjectInfo(String stdNo);
	public DepartmentCrtrVO getDeptCrtr(String deptCd);
	public List<String> getSubjectYear(String stdNo);
	public List<CourseRegistVO> getAllgrade(Map<String, String> mymap);
}
