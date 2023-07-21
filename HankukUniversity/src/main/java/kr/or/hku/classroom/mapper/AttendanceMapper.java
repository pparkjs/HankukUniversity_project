package kr.or.hku.classroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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
	

	
// ------------------------ 학생 출석 이의신청 ----------------------------// 	
//	public List<AttendanceVO> dmrList();
//	public AttendanceVO dmrDetail(String stdNo);
//	public int writeDmr(AttendanceVO attendanceVO);
//	public int updateDmr(AttendanceVO attendanceVO);
//	public int deleteDmr(String stdNo);

}
