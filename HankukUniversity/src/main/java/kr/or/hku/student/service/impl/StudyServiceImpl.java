package kr.or.hku.student.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.hku.student.vo.PaginationInfoVO;
import kr.or.hku.student.mapper.StudyMapper;
import kr.or.hku.student.service.StudyService;
import kr.or.hku.student.vo.StdCalendarVO;
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
		// 가입신청 승인
		int res = mapper.assignStudy(joinNo);
		// 가입신청 승인당한놈 찾아
		StudyVO studyVo  = mapper.selectAssignMem(joinNo);
		System.out.println("가입신청 당한놈 학번확인: "+studyVo.getStdNo()); 
		// 찾아서 스터디멤버로 쳐넣어
		mapper.insertStudyMem(studyVo);
		return res;
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
		mapper.deleteUnreadMsg(studyVo);
		mapper.readMessageInRoom(studyVo);
	}

	@Override
	public void readChatMessage(StudyVO studyVo) {
		mapper.readChatMessage(studyVo);
		
	}

	@Override
	public int insertMessage(StudyVO studyVo) {
		// 메시지 삽입
		int result = mapper.insertMessage(studyVo);
		
		// 나를 제외한 해당 방 사람들에게 안읽은 메시지 카운트
		mapper.updateMessageCountExceptMe(studyVo);
		
		int studyNo = studyVo.getStudyNo();
		List<StudyVO> memberList = mapper.getStudyMember(studyNo);
		for (int i = 0; i < memberList.size(); i++) {
			System.out.println("memberList: "+ memberList);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		for (StudyVO member : memberList) {
			map.put("msgNo", studyVo.getMsgNo());
			System.out.println("msgNo: "+ studyVo.getMsgNo());
			map.put("stdNo", member.getStdNo());
			System.out.println("stdNo: " + member.getStdNo());
			map.put("studyNo", studyVo.getStudyNo());
			// 메시지 등록 시마다 해당 방에 속한 유저들 대상으로 안읽은 유저 테이블에 추가
			mapper.insertUnreadMember(map);
		}
		return result;
	}
	

	@Override
	public int addStudy(StudyVO studyVo) {
		int res = mapper.addStudy(studyVo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stdNo", studyVo.getStdNo());
		map.put("studyNo", studyVo.getStudyNo());	
		System.out.println("getStudyNo: " + studyVo.getStudyNo());
		
		mapper.insertStudyLeader(map);
		
		return res;
	}
	
	@Override
	public List<StdCalendarVO> getStdCalList(Map<String, String> map) {
		return mapper.getStdCalList(map);
	}
	
	@Override
	public int updateStdCalList(StdCalendarVO stdCalendarVO) {
		return mapper.updateStdCalList(stdCalendarVO);
	}

	@Override
	public List<StudyVO> messageList(int studyNo) {
		// TODO Auto-generated method stub
		return mapper.messageList(studyNo);
	}

	
	@Override
	public int addStdCalList(StdCalendarVO stdCalendarVO) {
		return mapper.addStdCalList(stdCalendarVO);
	}
	
	@Override
	public int deleteStdCalendar(Map<String, String> map) {
		return mapper.deleteStdCalendar(map);
	}

	@Override
	public int addUnreadMem(StudyVO studyVo) {
		// TODO Auto-generated method stub
		return mapper.addUnreadMem(studyVo);
	}

	@Override
	public StudyVO getFilePath(String stdNo) {
		// TODO Auto-generated method stub
		return mapper.getFilePath(stdNo);
	}

	@Override
	public String selectRole(StudyVO studyVo) {
		// TODO Auto-generated method stub
		return mapper.selectRole(studyVo);
	}

	@Override
	public int insertStudyMem(StudyVO studyVo) {
		// TODO Auto-generated method stub
		return mapper.insertStudyMem(studyVo);
	}

	@Override
	public List<StudyVO> studyBoardList2(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.studyBoardList2(map);
	}
	
	@Override
	public int boardCount(PaginationInfoVO<StudyVO> pagingVO) {
		// TODO Auto-generated method stub
		return mapper.boardCount(pagingVO);
	}

	@Override
	public List<StudyVO> boardSelect(PaginationInfoVO<StudyVO> pagingVO) {
		// TODO Auto-generated method stub
		return mapper.boardSelect(pagingVO);
	}


}
