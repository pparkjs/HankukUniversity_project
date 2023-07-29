package kr.or.hku.classroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.classroom.vo.GradeVO;

@Mapper
public interface GradeManageMapper {

	public List<GradeVO> getStdList(String lecapNo);
	
	
}
