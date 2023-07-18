package kr.or.hku.classroom.serviceImpl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.mapper.AssignmentMapper;
import kr.or.hku.classroom.service.AssignmentService;
import kr.or.hku.classroom.vo.AssignmentVO;

@Service
public class AssignmentServiceImpl implements AssignmentService {

	@Autowired
	private AssignmentMapper mapper;

	@Override
	public AssignmentVO assignOne(String asmNo) {
		return mapper.assignOne(asmNo);
	}

	
	@Transactional(rollbackFor = SQLException.class)
	@Override
	public ServiceResult giveAssignToStds(List<String> stdList, String asmNo) {
		ServiceResult res = null;
		if (stdList != null && stdList.size() > 0) {
			for (int i = 0; i < stdList.size(); i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("stdNo", stdList.get(i));
				map.put("asmNo", asmNo);
//				Map<String, Object> map = stdList.get(i);
				int result = mapper.giveAssignToStd(map);
				if (result <= 0) {
					res = ServiceResult.FAILED;
					break;
				}
			}
		}
		if (res == null) {
			res = ServiceResult.OK;
		}
		return res;
	}
	
	@Override
	public List<String> getStdList(String lecapNo) {
		return mapper.getStdList(lecapNo);
	}

	@Override
	public int regi(AssignmentVO vo) {
		return mapper.regi(vo);
	}

	@Override
	public ServiceResult update(AssignmentVO vo) {
		ServiceResult result = null;
		int status = mapper.update(vo);
		if(status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public int delete(String lecapNo) {
		return mapper.delete(lecapNo);
	}

	@Override
	public AssignmentVO getAssignOne(String lecapNo) {
		return mapper.getAssignOne(lecapNo);
	}

	// 과제제출 테이블에 가용코드(과제제출여부 N) ,파일 null
	@Override
	public int insertAssignSubmit(AssignmentVO vo) {
		return mapper.insertAssignSubmit(vo);
	}

	// 알람테이블 알람번호, 알람 등록일, 알람제목, 알람타입
	@Override
	public int insertAlarm(AssignmentVO vo) {
		return mapper.insertAlarm(vo);
	}

	@Override
	public List<AssignmentVO> getStdListByAssign(String asmNo) {
		return mapper.getStdListByAssign(asmNo);
	}

}