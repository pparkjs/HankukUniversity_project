package kr.or.hku.mypage.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.student.vo.StudentVO;


@Mapper
public interface StdMypageMapper {
	
	public StudentVO detailInfo(String stdNo);
	public int updateInfo(StudentVO studentVO);
}
