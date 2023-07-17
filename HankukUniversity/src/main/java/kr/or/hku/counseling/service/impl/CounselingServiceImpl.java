package kr.or.hku.counseling.service.impl;

import java.sql.SQLException;
import java.util.List;

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
	public ServiceResult counselingRsvt(CounselingRsvtVO vo) {
		ServiceResult result = null;
		
		AlarmVO alarm = new AlarmVO();
		
		alarm.setAlarmTtl(vo.getStdNm() + "님의 상담예약신청");
		alarm.setAlarmType("counseling");
		alarm.setSendUserNo(vo.getStdNo());
		alarm.setReceiveUserNo(vo.getProNo());
		
		commonMapper.alarmInsert(alarm); // 알람 등록
		
		int cnt = counselingMapper.counselingRsvt(vo); // 상담예약
		
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

}
