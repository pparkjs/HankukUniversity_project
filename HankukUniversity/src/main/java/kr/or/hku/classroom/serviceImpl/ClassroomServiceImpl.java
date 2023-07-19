package kr.or.hku.classroom.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.classroom.mapper.ClassroomMapper;
import kr.or.hku.classroom.service.ClassroomService;
import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;

@Service
public class ClassroomServiceImpl implements ClassroomService {
	
	@Autowired
	private ClassroomMapper classroomMapper;
	

	@Override
	public List<ClassroomVO> selectList(String stdNo) {
	 return classroomMapper.selectList(stdNo);
	}

	@Override
	public List<LectureAplyVO> proSelectList(String proNo) {
		return classroomMapper.proSelectList(proNo);
	}
	
	@Override
	public List<AssignmentVO> getAssignList(String lecapNo) {
		return classroomMapper.getAssignList(lecapNo);
	}
	
	@Override
	public String getSubNm(String lecapNo) {
		return classroomMapper.getSubNm(lecapNo);
	}

}
