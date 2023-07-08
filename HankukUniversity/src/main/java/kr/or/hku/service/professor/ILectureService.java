package kr.or.hku.service.professor;

import java.util.List;
import java.util.Map;

import kr.or.hku.vo.CollegeVO;
import kr.or.hku.vo.DepartmentVO;
import kr.or.hku.vo.FacilitiesVO;
import kr.or.hku.vo.FacilityVO;
import kr.or.hku.vo.SubjectVO;

public interface ILectureService {

	public List<SubjectVO> getSubjectList();

	public List<CollegeVO> getCollegeList();

	public List<DepartmentVO> getDeptList(String college);

	public List<SubjectVO> selSubject(String deptNm);

	public List<SubjectVO> getcolSubject(String college);

	public Map<String, List<?>> getListMap(String college);

	public List<FacilityVO> getFlctList();
//
//	public List<FacilitiesVO> getFlctsList();

	public Map<String, List<?>> getTimeTable(String flct);
	
}
