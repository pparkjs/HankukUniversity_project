package kr.or.hku.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.lectureInfo.vo.CourseRegistVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;
import kr.or.hku.student.vo.EvaluationVO;
import kr.or.hku.student.vo.StudentInfoVO;

@Mapper
public interface StdGradeCheckMapper {
	public List<StudentInfoVO> getStudentInfo(String stdNo);
	public List<SubjectVO> getSubjectInfo(String stdNo);
	public int submitobjections(CourseRegistVO courseVO);
	public int insertEvaluation(EvaluationVO evalVO);
	public int updateEvaluCd(EvaluationVO evalVO);
}
