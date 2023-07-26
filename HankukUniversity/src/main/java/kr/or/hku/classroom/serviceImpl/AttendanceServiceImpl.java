package kr.or.hku.classroom.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.ServiceResult;
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
	@Override
	public Map<String, Object> getAtdcNo(AttendanceVO attend) {
		return attendanceMapper.getAtdcNo(attend);
	}

	@Override
	public ServiceResult submitAttendDmr(AttendanceVO vo) {
		ServiceResult result = null;
		int check = attendanceMapper.dmrCheck(vo.getAtdcNo());
		
		if(check > 0) {
			result = ServiceResult.EXIST;
		}else {
			int cnt = attendanceMapper.submitAttendDmr(vo);
			
			if(cnt > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}
		return result;
	}
	
	// 이의신청 현황 리스트
	@Override
	public List<AttendanceVO> attenDmrList(AttendanceVO vo) {
		return attendanceMapper.attenDmrList(vo);
	}
	
	// 이의신청 중복 확인
	@Override
	public int dmrCheck(int atdcNo) {
		return attendanceMapper.dmrCheck(atdcNo);
	}
	
	
	
	// 이의신청 삭제 
	@Override
	public ServiceResult deleteAttendDmr(int atdcNo) {
		ServiceResult result = null;
		int check = attendanceMapper.deleteAttendDmr(atdcNo);
		
		if(check > 0) {      
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public AttendanceVO dmrDetail(int atdcNo) {
		return attendanceMapper.dmrDetail(atdcNo);
	}

	
}
