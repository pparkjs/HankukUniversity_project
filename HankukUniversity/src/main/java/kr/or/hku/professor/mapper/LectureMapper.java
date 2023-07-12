package kr.or.hku.professor.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.CollegeVO;
import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.admin.vo.FacilitiesVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;
@Mapper
public interface LectureMapper {

	public List<SubjectVO> getSubjectList();

	public List<CollegeVO> getCollegeList();

	public List<DepartmentVO> getDeptList(String college);

	public List<SubjectVO> selSubject(String deptNm);

	public List<SubjectVO> getcolSubject(String college);

	public List<FacilityVO> getFlctList();

	public List<FacilitiesVO> getFlctsList(String flct);

	public List<LectureAplyVO> getClass(String flcts);

	public int applyLecture(LectureAplyVO vo);

	public int getLecapNo();

	public int applyProgram(LectureAplyVO vo);

	public int applySchedule(LectureAplyVO vo);

}
