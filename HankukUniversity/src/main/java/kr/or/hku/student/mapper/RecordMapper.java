package kr.or.hku.student.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.student.vo.StudentVO;
@Mapper
public interface RecordMapper {
	
	// 현재 로그인한 학생 학적정보 조회
	public StudentVO recordInfo(String stdNo);
}
