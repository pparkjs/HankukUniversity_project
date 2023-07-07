package kr.or.hku.mapper.student;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.vo.SubjectVO;

@Mapper
public interface CourseInfoMapper {
	public List<SubjectVO> getList();
}
