package kr.or.hku.lectureInfo.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.vo.DepartmentVO;
import kr.or.hku.lectureInfo.mapper.CourseInfoMapper;
import kr.or.hku.lectureInfo.service.ICourseInfoService;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;

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

	@Override
	public List<LectureAplyVO> getLecture(String status) {
		return courseMapper.getLecture(status);
	}

}
