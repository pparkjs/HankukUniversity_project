package kr.or.hku.student.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.hku.student.mapper.RecordMapper;
import kr.or.hku.student.service.RecordService;
import kr.or.hku.student.vo.RecordVO;
import kr.or.hku.student.vo.StudentVO;

@Service
public class RecordServiceImpl implements RecordService{
	
	@Inject
	private RecordMapper mapper;
	
	@Override
	public StudentVO recordInfo(String stdNo) {
		return mapper.recordInfo(stdNo);
		
	}

	@Override
	public List<RecordVO> recordList(String stdNo) {
		// TODO Auto-generated method stub
		return mapper.recordList(stdNo);
	}

	@Override
	public List<RecordVO> recordChanged(String stdNo) {
		// TODO Auto-generated method stub
		return mapper.recordChanged(stdNo);
	}

	@Override
	public int insertAcademic(RecordVO recordVo) {
		// TODO Auto-generated method stub
		return mapper.insertAcademic(recordVo);
	}

	@Override
	public int cancelRecord(int changeNo) {
		// TODO Auto-generated method stub
		return mapper.cancelRecord(changeNo);
	}

	@Override
	public int gradutePostpone(RecordVO recordVo) {
		// TODO Auto-generated method stub
		return mapper.gradutePostpone(recordVo);
	}

	@Override
	public int graduteApply(RecordVO recordVo) {
		// TODO Auto-generated method stub
		return mapper.graduteApply(recordVo);
	}


}
