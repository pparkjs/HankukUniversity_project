package kr.or.hku.classroom.service;

import java.util.List;

import kr.or.hku.classroom.vo.AttendanceVO;

public interface AttendanceService {

	public List<AttendanceVO> dmrList();
	
	public AttendanceVO dmrDetail(String stdNo);
	
	public int writeDmr(AttendanceVO attendanceVO);
	
	public int updateDmr(AttendanceVO attendanceVO);
	
	public int deleteDmr(String stdNo);
}
