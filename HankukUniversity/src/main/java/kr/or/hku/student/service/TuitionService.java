package kr.or.hku.student.service;

import java.util.List;

import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.TuitionVO;

public interface TuitionService {

	public List<TuitionVO> selectTuitionList(StudentVO vo);

}
