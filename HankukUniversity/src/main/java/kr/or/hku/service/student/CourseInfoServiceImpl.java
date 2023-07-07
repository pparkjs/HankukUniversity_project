package kr.or.hku.service.student;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.mapper.student.CourseInfoMapper;
import kr.or.hku.vo.DepartmentVO;
import kr.or.hku.vo.SubjectVO;

@Service
public class CourseInfoServiceImpl implements ICourseInfoService {
	
	@Autowired
	private CourseInfoMapper courseMapper;
	
	@Override
	public List<SubjectVO> getList(Map<String, Object> map) {
		return courseMapper.getList(map);
	}

	@Override
	public List<DepartmentVO> getAllDept() {
		return courseMapper.getAllDept();
	}

}
