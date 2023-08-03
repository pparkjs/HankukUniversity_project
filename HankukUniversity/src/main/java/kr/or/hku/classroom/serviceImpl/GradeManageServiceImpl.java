package kr.or.hku.classroom.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.mapper.GradeManageMapper;
import kr.or.hku.classroom.service.GradeManageService;
import kr.or.hku.classroom.vo.GradeVO;
import kr.or.hku.lectureInfo.vo.LecturePlanVO;

@Service
public class GradeManageServiceImpl implements GradeManageService {
	
	@Autowired
	private GradeManageMapper gradeMapper;

	@Override
	public List<GradeVO> getStdList(String lecapNo) {
		return gradeMapper.getStdList(lecapNo);
	}

	@Transactional
	@Override
	public ServiceResult confirmScore(GradeVO vo) {
		ServiceResult result = null;
		// 중간 기말 기본키 갖고옴
		List<Map<String, String>> testMapList = gradeMapper.getTestNos(vo);
		int res = 0; // 성공했는지 여부
		if(testMapList.size() == 2) { // 중간 기말이 있어야 실행
			for (Map<String, String> map : testMapList) {
				if(map.get("TEST_SE").equals("middle")) {// 중간일때만 실행
					vo.setTestNo(map.get("TEST_NO"));
					res = gradeMapper.confirmMiddleScore(vo);
				}else if(map.get("TEST_SE").equals("final") && res > 0) {
					vo.setTestNo(map.get("TEST_NO")); // 파이널 기본키 들어옴
					res = gradeMapper.confirmFinalScore(vo);
				}  
			}
			if(res > 0) {
				res = gradeMapper.confirmRealScore(vo);
			}
		}
		if (res > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	@Override
	public Map<String, String> getStdAsignScr(GradeVO gradeVO) {
		return gradeMapper.getStdAsignScr(gradeVO);
	}
	
	@Override
	public Map<String, String> getStdAtdCnt(GradeVO gradeVO) {
		return gradeMapper.getStdAtdCnt(gradeVO);
	}
	
	@Override
	public LecturePlanVO getPercent(String lecapNo) {
		return gradeMapper.getPercent(lecapNo);
	}

	@Override
	public GradeVO modifyScore(Map<String, String> myMap) {
		return gradeMapper.modifyScore(myMap);
	}

	@Override
	public List<Map<String, String>> getTestNos(GradeVO vo) {
		return gradeMapper.getTestNos(vo);
	}
	
}
