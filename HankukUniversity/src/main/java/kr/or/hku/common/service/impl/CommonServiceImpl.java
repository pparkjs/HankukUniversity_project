package kr.or.hku.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.common.mapper.CommonMapper;
import kr.or.hku.common.service.CommonService;
import kr.or.hku.common.vo.AlarmVO;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonMapper commonMapper;
	
	@Override
	public List<CommonVO> getAllCommonData() {
		return commonMapper.getAllCommonData();
	}

	@Override
	public StudentVO myAllInfo(String stdNo) {
		return commonMapper.myAllInfo(stdNo);
	}

	@Override
	public List<FacilityVO> floorListFlct(String flctNo) {
		return commonMapper.floorListFlct(flctNo);
	}

	@Override
	public List<AlarmVO> getAlarmList(User user) {
		return commonMapper.getAlarmList(user.getUsername());
	}

	@Override
	public int alarmDelete(int alarmNo) {
		return commonMapper.alarmDelete(alarmNo);
	}

	@Override
	public ProfessorVO myProInfo(String proNo) {
		return commonMapper.myProInfo(proNo);
	}


}
