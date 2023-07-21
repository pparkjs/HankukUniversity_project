package kr.or.hku.classroom.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.classroom.mapper.AttendanceMapper;
import kr.or.hku.classroom.service.AttendanceService;
import kr.or.hku.classroom.vo.AttendanceVO;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceMapper attendanceMapper;
	
	// 출석관리 
	@Override
	public AttendanceVO manageAttendance(AttendanceVO vo) {
		return attendanceMapper.manageAttendance(vo);
	}
	
	// 해당 과목 수강하는 학생 리스트 
	@Override
	public List<AttendanceVO> getStdList(String lecapNo) {
		return attendanceMapper.getStdList(lecapNo);
	}
	
	// 학생 출석 여부 가져오는 리스트
	@Override
	public List<AttendanceVO> getStdAttendanceList(AttendanceVO vo) {
		return attendanceMapper.getStdAttendanceList(vo);
	}	

	// 출석 변경 
	@Override
	public int updateAttendance(AttendanceVO vo) {
		return attendanceMapper.updateAttendance(vo);
	}
		
	
// ------------------------ 학생 출석 이의신청 ----------------------------// 
//	@Override
//	public List<AttendanceVO> dmrList() {
//		return attendanceMapper.dmrList();
//	}
//
//	@Override
//	public AttendanceVO dmrDetail(String stdNo) {
//		return attendanceMapper.dmrDetail(stdNo);
//	}
//
//	@Override
//	public int writeDmr(AttendanceVO attendanceVO) {
//		return attendanceMapper.writeDmr(attendanceVO);
//	}
//
//	@Override
//	public int updateDmr(AttendanceVO attendanceVO) {
//		return attendanceMapper.updateDmr(attendanceVO);
//	}
//
//	@Override
//	public int deleteDmr(String stdNo) {
//		return attendanceMapper.deleteDmr(stdNo);
//	}
	
}
