package kr.or.hku.classroom.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.mapper.AttendanceMapper;
import kr.or.hku.classroom.service.AttendanceService;
import kr.or.hku.classroom.vo.AttendanceVO;
import kr.or.hku.common.mapper.CommonMapper;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.vo.AlarmVO;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.student.vo.StudentVO;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceMapper attendanceMapper;
	
	@Autowired
	private CommonFileService fileService;
	
	@Autowired
	private CommonMapper commonMapper;
	
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
	
	// 출석 이의신청 리스트
	@Override
	public List<AttendanceVO> attendanceDmrList(String lecapNo) {
		List<AttendanceVO> attendanceList = attendanceMapper.attendanceDmrList(lecapNo);
		List<AttendanceVO> returnList = new ArrayList<AttendanceVO>();
		
		for (AttendanceVO attendanceVO : attendanceList) {
			int atchFileNo = attendanceVO.getAtchFileNo();
			List<AttachFileVO> fileList = fileService.getFileList(atchFileNo);
			attendanceVO.setFileList(fileList);
			returnList.add(attendanceVO);
		}
		return returnList;
	}
	
	// 출석 이의신청 승인
	@Override
	public ServiceResult attendanceAppv(String atdcNo) {
		ServiceResult result = null;
		int check1 = attendanceMapper.attendanceAppv1(atdcNo);
		int check2 = attendanceMapper.attendanceAppv2(atdcNo);
		
		if(check1 > 0 && check2 > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	// 출석 이의신청 반려
	@Override
	public ServiceResult attendanceRej(String atdcNo) {
		ServiceResult result = null;
		int check1 = attendanceMapper.attendanceRej1(atdcNo);
		int check2 = attendanceMapper.attendanceRej2(atdcNo);
		
		if(check1 > 0 && check2 > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	
// ------------------------ 학생 출석 이의신청 ----------------------------// 
	@Override
	public Map<String, Object> getAtdcNo(AttendanceVO attend) {
		return attendanceMapper.getAtdcNo(attend);
	}

	@Override
	public ServiceResult submitAttendDmr(AttendanceVO vo, String proNo, StudentVO std) {
		ServiceResult result = null;
		int check = attendanceMapper.dmrCheck(vo.getAtdcNo());
		
		if(check > 0) {
			result = ServiceResult.EXIST;
		}else {
			
			// 출석이의신청시 알람!!
			AlarmVO alarm = new AlarmVO();
			
			alarm.setAlarmTtl(std.getStdNm() + "님의 출석이의신청");
			alarm.setAlarmType("attend-dmr");
			alarm.setSendUserNo(std.getStdNo());
			alarm.setReceiveUserNo(proNo);
			alarm.setAlarmPathNo(vo.getLecapNo());
			alarm.setSendProfile(std.getStdProfilePath());
			
			commonMapper.alarmInsert(alarm); // 알람 등록
			
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

	@Override
	public String getProNo(String lecapNo) {
		return attendanceMapper.getProNo(lecapNo);
	}

	
	
	
}
