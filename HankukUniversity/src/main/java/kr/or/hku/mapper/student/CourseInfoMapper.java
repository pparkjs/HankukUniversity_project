package kr.or.hku.mapper.student;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.vo.DepartmentVO;
import kr.or.hku.vo.SubjectVO;

@Mapper
public interface CourseInfoMapper {
	public List<SubjectVO> getList(Map<String, Object> map);
	public List<DepartmentVO> getAllDept();
}
