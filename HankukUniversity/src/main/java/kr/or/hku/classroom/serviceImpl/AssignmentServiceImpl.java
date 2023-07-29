package kr.or.hku.classroom.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.MapperFeature;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.mapper.AssignmentMapper;
import kr.or.hku.classroom.service.AssignmentService;
import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.vo.AttachFileVO;

@Service
public class AssignmentServiceImpl implements AssignmentService {

	@Autowired
	private AssignmentMapper mapper;
	
	@Autowired
	private CommonFileService fileService;

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
	
	// 과제 등록
	@Override
	public int regi(AssignmentVO vo) {
		return mapper.regi(vo);
	}

	// 과제 수정
	@Override
	public ServiceResult update(AssignmentVO vo) {
		ServiceResult result = null;
		int status = mapper.update(vo);
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public int delete(String asmNo) {
		return mapper.delete(asmNo);
	}
	
	// 과제 상세 
	@Override
	public AssignmentVO getAssignOne(String lecapNo) {
		return mapper.getAssignOne(lecapNo);
	}


	
	// 과제 상세페이지 학생 리스트
	@Override
	public List<AssignmentVO> getStdListByAssign(String asmNo) {
		List<AssignmentVO> stdListByAssign = mapper.getStdListByAssign(asmNo);
		
		List<AssignmentVO> returnStdListByAssign = new ArrayList<AssignmentVO>();
		
		for (AssignmentVO assignmentVO : stdListByAssign) {
			int atchFileNo = assignmentVO.getAtchFileNo();
			List<AttachFileVO> fileList = fileService.getFileList(atchFileNo);
			assignmentVO.setFileList(fileList);
			returnStdListByAssign.add(assignmentVO);
		}
		return returnStdListByAssign;
	}
	
	// 과제 상세페이지 학생 성적 부여
	@Override
	public int giveScore(AssignmentVO assignmentVO) {
		return mapper.giveScore(assignmentVO);
	}
	
	// 학생 과제 상세
	@Override
	public AssignmentVO stdAssignDetail(AssignmentVO vo) {
		return mapper.stdAssignDetail(vo);

	}
	
	// 학생 과제 제출
	@Override
	public int assignmentSubmit(AssignmentVO vo) {
		return mapper.assignmentSubmit(vo);
	}
	
	// 과제 제출 현황 
	@Override
	public List<AssignmentVO> submitList(AssignmentVO vo) {
		return mapper.submitList(vo);
	}
	
	// 과제 수정 
	@Override
	public ServiceResult modifyAssignment(AssignmentVO vo) {
		ServiceResult res = null;
		int check = mapper.modifyAssignment(vo);
		
		if(check > 0) {
			res = ServiceResult.OK;
		}
		return res;
	}
	
	// 과제 삭제  
	@Override
	public ServiceResult deleteAssignment(int asmNo) {
		ServiceResult result = null;
		int check = mapper.deleteAssignment(asmNo);
		
		if(check > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
}