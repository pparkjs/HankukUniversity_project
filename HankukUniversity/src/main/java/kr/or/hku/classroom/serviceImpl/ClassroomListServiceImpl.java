package kr.or.hku.classroom.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.classroom.mapper.ClassroomListMapper;
import kr.or.hku.classroom.service.ClassroomListService;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;

@Service
public class ClassroomListServiceImpl implements ClassroomListService {
	
	@Autowired
	private ClassroomListMapper classroomListMapper;
	

	@Override
	public List<ClassroomVO> selectList(String stdNo) {
	 return classroomListMapper.selectList(stdNo);
	}

	@Override
	public List<LectureAplyVO> proSelectList(String proNo) {
		return classroomListMapper.proSelectList(proNo);
	}

}
