package kr.or.hku.service.student;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.hku.mapper.student.StudyMapper;
import kr.or.hku.vo.StudyVO;

@Service
public class StudyServiceImpl implements StudyService{
	
	@Inject
	private StudyMapper mapper;

	@Override
	public List<StudyVO> studyList() {
		return null;
	}

	@Override
	public StudyVO studyRoom(int studyNo) {
		return null;
	}

	@Override
	public int addStudy(StudyVO studyVo) {
		return mapper.addStudy(studyVo);
	}

	@Override
	public int delStudy(int studyNo) {
		return 0;
	}

	@Override
	public int intoStudy(StudyVO studyVo) {
		return 0;
	}

	@Override
	public int assignStudy(StudyVO studyVo) {
		return 0;
	}

	@Override
	public int exitStudy(int stdNo) {
		return 0;
	}
	
}
