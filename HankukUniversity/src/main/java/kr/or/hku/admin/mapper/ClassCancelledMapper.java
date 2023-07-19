package kr.or.hku.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.StudentVO;
import kr.or.hku.admin.vo.SubjectCancelVO;

@Mapper
public interface ClassCancelledMapper {
	public List<SubjectCancelVO> getClassCancelledList();
	public List<StudentVO> getStdInLecture(Map<String, String> map);
}
