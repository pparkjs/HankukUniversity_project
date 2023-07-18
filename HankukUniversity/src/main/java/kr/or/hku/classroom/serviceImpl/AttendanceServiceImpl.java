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

	@Override
	public List<AttendanceVO> dmrList() {
		return attendanceMapper.dmrList();
	}

	@Override
	public AttendanceVO dmrDetail(String stdNo) {
		return attendanceMapper.dmrDetail(stdNo);
	}

	@Override
	public int writeDmr(AttendanceVO attendanceVO) {
		return attendanceMapper.writeDmr(attendanceVO);
	}

	@Override
	public int updateDmr(AttendanceVO attendanceVO) {
		return attendanceMapper.updateDmr(attendanceVO);
	}

	@Override
	public int deleteDmr(String stdNo) {
		return attendanceMapper.deleteDmr(stdNo);
	}
	
}
