package kr.or.hku.service.student;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.hku.mapper.student.RecordMapper;
import kr.or.hku.vo.StudentVO;

@Service
public class RecordServiceImpl implements RecordService{
	
	@Inject
	private RecordMapper mapper;
	
	@Override
	public StudentVO recordInfo(String stdNo) {
		return mapper.recordInfo(stdNo);
		
	}

}
