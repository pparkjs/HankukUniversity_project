package kr.or.hku.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.TuitionVO;

@Mapper
public interface TuitionMapper {

	public List<TuitionVO> selectTuitionList(StudentVO vo);

	public TuitionVO selectTuition(String stdNo);

}
