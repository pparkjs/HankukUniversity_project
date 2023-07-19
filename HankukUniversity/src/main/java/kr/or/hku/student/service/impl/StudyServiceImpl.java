package kr.or.hku.student.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.hku.notice.vo.PaginationInfoVO;
import kr.or.hku.student.mapper.StudyMapper;
import kr.or.hku.student.service.StudyService;
import kr.or.hku.student.vo.StudyVO;

@Service
public class StudyServiceImpl implements StudyService{
	
	@Inject
	private StudyMapper mapper;

	@Override
	public List<StudyVO> studyList(String stdNo) {
		return mapper.studyList(stdNo);
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
		return mapper.intoStudy(studyVo);
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

	@Override
	public List<StudyVO> waitStudy(String stdNo) {
		// TODO Auto-generated method stub
		return mapper.waitStudy(stdNo);
	}

	@Override
	public List<StudyVO> studyBoardList() {
		// TODO Auto-generated method stub
		return mapper.studyBoardList();
	}

	@Override
	public int boardCount(PaginationInfoVO<StudyVO> pagingVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StudyVO> boardSelect(PaginationInfoVO<StudyVO> pagingVO) {
		// TODO Auto-generated method stub
		return mapper.boardSelect(pagingVO);
	}

	@Override
	public List<StudyVO> myStudy(String stdNo) {
		// TODO Auto-generated method stub
		return mapper.myStudy(stdNo);
	}

	@Override
	public int insertStudyBoard(StudyVO studyVo) {
		// TODO Auto-generated method stub
		return mapper.insertStudyBoard(studyVo);
	}

	@Override
	public StudyVO studyBoardDetail(int stboNo) {
		// TODO Auto-generated method stub
		mapper.studyBoHit(stboNo);
		return mapper.studyBoardDetail(stboNo);
	}

	@Override
	public int deleteStudyBoard(int stboNo) {
		// TODO Auto-generated method stub
		return mapper.deleteStudyBoard(stboNo);
	}

	@Override
	public int modifyStudyBoard(StudyVO studyVo) {
		// TODO Auto-generated method stub
		return mapper.modifyStudyBoard(studyVo);
	}

	@Override
	public int studyBoHit(int stboNo) {
		// TODO Auto-generated method stub
		return mapper.studyBoHit(stboNo);
	}

	@Override
	public int getMemberCount(int studyNo) {
		// TODO Auto-generated method stub
		return mapper.getMemberCount(studyNo);
	}

	@Override
	public List<Integer> getUnreadCntByUser(StudyVO studyVo) {
		// TODO Auto-generated method stub
		return mapper.getUnreadCntByUser(studyVo);
	}

	@Override
	public void readMessageInRoom(StudyVO studyVo) {
		mapper.readMessageInRoom(studyVo);
		
	}

	@Override
	public void readChatMessage(StudyVO studyVo) {
		mapper.readChatMessage(studyVo);
		
	}

	@Override
	public int insertMessage(StudyVO studyVo) {
		// TODO Auto-generated method stub
		return mapper.insertMessage(studyVo);
	}

}
