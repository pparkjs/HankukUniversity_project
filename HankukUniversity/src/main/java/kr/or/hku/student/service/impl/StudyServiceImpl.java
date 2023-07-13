package kr.or.hku.student.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.hku.student.mapper.StudyMapper;
import kr.or.hku.student.service.StudyService;
import kr.or.hku.student.vo.StudyVO;

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
	
	@Override
	public List<StudyVO> applicationsList(int studyNo) {
		return mapper.applicationsList(studyNo);
	}

	@Override
	public void addStudy(StudyVO studyVo) {
		mapper.addStudy(studyVo);
	}

	@Override
	public void delStudy(int studyNo) {
		mapper.delStudyMem(studyNo);
		mapper.delStudy(studyNo);
	}

	@Override
	public int intoStudy(StudyVO studyVo) {
		return 0;
	}

	@Override
	public int exitStudy(StudyVO studyVo) {
		return mapper.exitStudy(studyVo);
	}

	@Override
	public int delStudyMem(int studyNo) {
		return mapper.delStudyMem(studyNo);
	}

	@Override
	public StudyVO applDetail(StudyVO studyVo) {
		return mapper.applDetail(studyVo);
	}

	@Override
	public int assignStudy(int joinNo) {
		return mapper.assignStudy(joinNo);
	}

	@Override
	public int rejStudy(int joinNo) {
		return mapper.rejStudy(joinNo);
	}

	@Override
	public List<StudyVO> scheduleList(StudyVO studyVo) {
		// TODO Auto-generated method stub
		return mapper.scheduleList(studyVo);
	}

}
