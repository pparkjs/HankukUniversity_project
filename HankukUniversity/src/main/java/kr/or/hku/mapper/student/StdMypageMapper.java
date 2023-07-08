package kr.or.hku.mapper.student;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.vo.StudentVO;

@Mapper
public interface StdMypageMapper {
	
	public StudentVO detailInfo(String stdNo);
	public int updateInfo(StudentVO studentVO);
}
