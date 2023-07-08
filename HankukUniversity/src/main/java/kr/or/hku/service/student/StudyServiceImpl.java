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
		return mapper.studyList();
	}

	@Override
	public StudyVO studyRoom(int studyNo) {
		return mapper.studyRoom(studyNo);
	}
	
	@Override
	public List<StudyVO> studyMem(int studyNo) {
		return mapper.studyMem(studyNo);
	}
	
//	@Override
//	public List<StudyVO> applicationsList(int studyNo) {
//		return mapper.applicationsList(studyNo);
//	}

	@Override
	public void addStudy(StudyVO studyVo) {
		mapper.addStudy(studyVo);
	}

	@Override
	public void delStudy(int studyNo) {
		mapper.delStudy(studyNo);
		mapper.delStudyMem(studyNo);
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

	@Override
	public int delStudyMem(int studyNo) {
		// TODO Auto-generated method stub
		return mapper.delStudyMem(studyNo);
	}

}
