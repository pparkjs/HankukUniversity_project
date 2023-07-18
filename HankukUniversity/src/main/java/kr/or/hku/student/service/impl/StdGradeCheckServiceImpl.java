package kr.or.hku.student.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.ServiceResult;
import kr.or.hku.lectureInfo.vo.CourseRegistVO;
import kr.or.hku.student.mapper.StdGradeCheckMapper;
import kr.or.hku.student.service.StdGradeCheckService;
import kr.or.hku.student.vo.DepartmentCrtrVO;
import kr.or.hku.student.vo.EvaluationVO;
import kr.or.hku.student.vo.StudentInfoVO;

@Service
public class StdGradeCheckServiceImpl implements StdGradeCheckService {
	
	@Autowired
	private StdGradeCheckMapper gradeCheckMapper;
	
	
	@Override
	public Map<String, List<?>> getGradeInfo(String stdNo) {
		Map<String,List<?>> map = new HashMap<String, List<?>>();
		map.put("stdInfo", gradeCheckMapper.getStudentInfo(stdNo));
		map.put("subject",gradeCheckMapper.getSubjectInfo(stdNo));
		return map;
	}
	
	@Override
	public ServiceResult submitobjections(CourseRegistVO courseVO) {
		int result = gradeCheckMapper.submitobjections(courseVO);
		if(result>0) {
			return ServiceResult.OK;
		}else {
			return ServiceResult.FAILED;
		}
	}
	
	@Override
	public ServiceResult insertEvaluation(EvaluationVO evalVO) {
		ServiceResult result;
		int result1= gradeCheckMapper.insertEvaluation(evalVO);
		int result2= gradeCheckMapper.updateEvaluCd(evalVO);
		
		if(result1 > 0 && result2 >0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
@Override
	public Map<String, List<?>> getAllGradeInfo(String stdNo) {
	Map<String,List<?>> map = new HashMap<String, List<?>>();
		map.put("stdInfo", gradeCheckMapper.getStudentInfo(stdNo));
		map.put("subject",gradeCheckMapper.getAllSubjectInfo(stdNo));
		map.put("subjectYr", gradeCheckMapper.getSubjectYear(stdNo));
		return map;
	}

@Override
public DepartmentCrtrVO getDeptCrtr(String deptCd) {
	return gradeCheckMapper.getDeptCrtr(deptCd);
}


@Override
public List<CourseRegistVO> getAllgrade(Map<String, String> mymap) {
	// TODO Auto-generated method stub
	return gradeCheckMapper.getAllgrade(mymap);
}

}
