package kr.or.hku.lectureInfo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;

@Mapper
public interface CourseInfoMapper {
	public List<SubjectVO> getList(Map<String, Object> map);
	public List<DepartmentVO> getAllDept();
	public List<LectureAplyVO> getLecture(String status);
}
