package kr.or.hku.classroom.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.AttendanceVO;

@Mapper
public interface AttendanceMapper {
	
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
	public int attendanceAppv1(String atdcNo);  
	public int attendanceAppv2(String atdcNo);  
	
	// 출석 이의신청 반려
	public int attendanceRej1(String atdcNo);
	public int attendanceRej2(String atdcNo);
		
	
// ------------------------ 학생 출석 이의신청 ----------------------------// 	
	// 출석번호 가져오기
	public Map<String, Object> getAtdcNo(AttendanceVO attend);
	
	// 이의신청하기 
	public int submitAttendDmr(AttendanceVO attend);
	
	// 이의신청현황 리스트 
	public List<AttendanceVO> attenDmrList(AttendanceVO vo);
	
	// 이의신청 주차 중복 확인 
	public int dmrCheck(int atdcNo);
	
	// 이의신청 상세
	public AttendanceVO dmrDetail(int atdcNo);
	
	// 이의신청 삭제 
	public int deleteAttendDmr(int atdcNo);

	public String getProNo(String lecapNo);
}
