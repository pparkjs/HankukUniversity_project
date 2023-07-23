package kr.or.hku.counseling.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.hku.ServiceResult;
import kr.or.hku.common.mapper.CommonMapper;
import kr.or.hku.common.service.CommonService;
import kr.or.hku.common.vo.AlarmVO;
import kr.or.hku.counseling.mapper.CounselingMapper;
import kr.or.hku.counseling.service.CounselingService;
import kr.or.hku.counseling.vo.CounselingRsvtVO;
import kr.or.hku.lectureInfo.vo.LectureScheduleVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;

@Service
public class CounselingServiceImpl implements CounselingService {
	
	@Autowired
	private CounselingMapper counselingMapper;
	
	@Autowired
	private CommonMapper commonMapper;
	
	@Override
	public List<ProfessorVO> getProList(String deptCd) {
		return counselingMapper.getProList(deptCd);
	}

	@Override
	public List<LectureScheduleVO> getLecList(String proNo) {
		return counselingMapper.getLecList(proNo);
	}

	@Override
	public List<CounselingRsvtVO> getCounseList(String proNo) {
		return counselingMapper.getCounseList(proNo);
	}

	@Transactional(rollbackFor = SQLException.class)
	@Override
	public ServiceResult counselingRsvt(CounselingRsvtVO vo, HttpSession session) {
		ServiceResult result = null;
		StudentVO std = (StudentVO)session.getAttribute("std");
		
		AlarmVO alarm = new AlarmVO();
		
		alarm.setAlarmTtl(vo.getStdNm() + "님의 상담예약신청");
		alarm.setAlarmType("counseling");
		alarm.setSendUserNo(vo.getStdNo());
		alarm.setReceiveUserNo(vo.getProNo());
		alarm.setAlarmPathNo("none");
		alarm.setSendProfile(std.getStdProfilePath());
		
		commonMapper.alarmInsert(alarm); // 알람 등록
		
		int cnt = counselingMapper.counselingRsvt(vo); // 상담예약
		
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<CounselingRsvtVO> counselingRecord(String stdNo) {
		List<CounselingRsvtVO> list = counselingMapper.counselingRecord(stdNo);
		for (CounselingRsvtVO vo : list) {
			String hours = periodChange(vo.getPeriodCd());
			vo.setPeriodCd(hours);
			
			if(vo.getAttendModeCd().equals("nonface")) {
				vo.setAttendModeCd("비대면");
			}else if(vo.getAttendModeCd().equals("face")) {
				vo.setAttendModeCd("대면");
			}
		}
		
		return list;
	}
	
	// 교시코드를 시간으로 나타내주기 위한 메소드
	public String periodChange(String period) {
		String time = "";
		switch(period){
			case "1":
	            time = "09:00 ~ 10:00";
	            break;
	        case "2":
	            time = "10:00 ~ 11:00";
	            break;
	        case "3":
	            time = "11:00 ~ 12:00";
	            break;
	        case "4":
	            time = "12:00 ~ 13:00";
	            break;
	        case "5":
	            time = "13:00 ~ 14:00";
	            break;
	        case "6":
	            time = "14:00 ~ 15:00";
	            break;
	        case "7":
	            time = "15:00 ~ 16:00";
	            break;
	        case "8":
	            time = "16:00 ~ 17:00";
	            break;
	        case "9":
	            time = "17:00 ~ 18:00";
	            break;
		}
		return time;
	}

	@Override
	public List<CounselingRsvtVO> studentCounseList(String proNo) {
		List<CounselingRsvtVO> list = counselingMapper.studentCounseList(proNo);
		
		for (CounselingRsvtVO vo : list) {
			String hours = periodChange(vo.getPeriodCd());
			vo.setPeriodCd(hours);
			
			if(vo.getAttendModeCd().equals("nonface")) {
				vo.setAttendModeCd("비대면");
			}else if(vo.getAttendModeCd().equals("face")) {
				vo.setAttendModeCd("대면");
			}
		}
				
		return list;
	}

	@Override
	public ServiceResult studentCounseAppv(int dscsnNo) {
		ServiceResult result = null;
		
		int cnt = counselingMapper.studentCounseAppv(dscsnNo);
		
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult studentCounseRej(CounselingRsvtVO vo) {
		ServiceResult result = null;
		
		int cnt = counselingMapper.studentCounseRej(vo);
		
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

}
