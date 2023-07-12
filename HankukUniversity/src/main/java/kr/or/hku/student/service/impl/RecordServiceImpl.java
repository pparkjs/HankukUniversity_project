package kr.or.hku.student.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.hku.student.mapper.RecordMapper;
import kr.or.hku.student.service.RecordService;
import kr.or.hku.student.vo.StudentVO;

@Service
public class RecordServiceImpl implements RecordService{
	
	@Inject
	private RecordMapper mapper;
	
	@Override
	public StudentVO recordInfo(String stdNo) {
		return mapper.recordInfo(stdNo);
		
	}

}
