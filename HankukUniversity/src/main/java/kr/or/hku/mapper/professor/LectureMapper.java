package kr.or.hku.mapper.professor;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.vo.CollegeVO;
import kr.or.hku.vo.DepartmentVO;
import kr.or.hku.vo.FacilitiesVO;
import kr.or.hku.vo.FacilityVO;
import kr.or.hku.vo.SubjectVO;
@Mapper
public interface LectureMapper {

	public List<SubjectVO> getSubjectList();

	public List<CollegeVO> getCollegeList();

	public List<DepartmentVO> getDeptList(String college);

	public List<SubjectVO> selSubject(String deptNm);

	public List<SubjectVO> getcolSubject(String college);

	public List<FacilityVO> getFlctList();

	public List<FacilitiesVO> getFlctsList(String flct);

}
