package kr.or.hku.classroom.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.vo.AttendanceVO;
import kr.or.hku.student.vo.StudentVO;

public interface AttendanceService {
	
	// ------------------------ 교수 ----------------------------//  
	// 출석 관리
	public AttendanceVO manageAttendance(AttendanceVO vo);
	
	// 해당 과목 수강하는 학생 리스트 
	public List<AttendanceVO> getStdList(String lecapNo);

	public List<AttendanceVO> getStdAttendanceList(AttendanceVO vo);
	
	// 출석 변경 
	public int updateAttendance(AttendanceVO vo);
	
	// 출석 이의신청 리스트
	public List<AttendanceVO> attendanceDmrList(String lecapNo);
	
	// 출석 이의신청 승인
	public ServiceResult attendanceAppv(String atdcNo);
	
	// 출석 이의신청 반려
	public ServiceResult attendanceRej(String atdcNo);
	
	
// ------------------------ 학생 ----------------------------//  
	// 출석번호 가져오기
	public Map<String, Object> getAtdcNo(AttendanceVO attend);
	
	// 이의신청하기 
	public ServiceResult submitAttendDmr(AttendanceVO attend, String proNo, StudentVO std);
	
	// 이의신청현황 리스트 
	public List<AttendanceVO> attenDmrList(AttendanceVO vo);
	
	// 이의신청 주차 중복 확인 
	public int dmrCheck(int atdcNo);
	
	// 이의신청 상세
	public AttendanceVO dmrDetail(int atdcNo);
	
	// 이의신청 삭제 
	public ServiceResult deleteAttendDmr(int atdcNo);

	public String getProNo(String lecapNo);

	
	
	
	
	
}
