package kr.or.hku.student.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.hku.student.mapper.TuitionMapper;
import kr.or.hku.student.service.TuitionService;
import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.TuitionVO;

@Service
public class TuitionServiceImpl implements TuitionService {
	
	@Inject
	private TuitionMapper mapper;

	@Override
	public List<TuitionVO> selectTuitionList(StudentVO vo) {
		return mapper.selectTuitionList(vo);
	}

}
