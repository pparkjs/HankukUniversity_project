package kr.or.hku.classroom.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.mapper.AssignmentMapper;
import kr.or.hku.classroom.service.AssignmentService;
import kr.or.hku.classroom.vo.AssignmentVO;

@Service
public class AssignmentServiceImpl implements AssignmentService {
	
	@Autowired
	private AssignmentMapper mapper;
	
	@Override
	public List<AssignmentVO> assignList(String proNm) {
		return mapper.assignList(proNm);
	}

	@Override
	public AssignmentVO detail(String proNo) {
		return mapper.detail(proNo);
	}

	@Override
	public ServiceResult regi(AssignmentVO assignVO) {
		return mapper.regi(assignVO);
	}

	@Override
	public int update(AssignmentVO assignmentVO) {
		return mapper.update(assignmentVO);
	}

	@Override
	public int delete(String proNo) {
		return mapper.delete(proNo);
	}
	
	@Override
	public AssignmentVO getAssignOne(int lecapNo) {
		return mapper.getAssignOne(lecapNo);
	}

}
