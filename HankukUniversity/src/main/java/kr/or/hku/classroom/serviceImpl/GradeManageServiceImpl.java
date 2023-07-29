package kr.or.hku.classroom.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.classroom.mapper.GradeManageMapper;
import kr.or.hku.classroom.service.GradeManageService;
import kr.or.hku.classroom.vo.GradeVO;

@Service
public class GradeManageServiceImpl implements GradeManageService {
	
	@Autowired
	private GradeManageMapper gradeMapper;

	@Override
	public List<GradeVO> getStdList(String lecapNo) {
		return gradeMapper.getStdList(lecapNo);
	}

	
}
