package kr.or.hku.common.service;

import java.util.List;

import org.springframework.security.core.userdetails.User;

import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.common.vo.AlarmVO;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.professor.vo.ProfessorVO;
import kr.or.hku.student.vo.StudentVO;


public interface CommonService {
	public List<CommonVO> getAllCommonData();
	public StudentVO myAllInfo(String stdNo);
	public List<FacilityVO> floorListFlct(String flctNo);
	public List<AlarmVO> getAlarmList(User users);
	public int alarmDelete(int alarmNo);
	public ProfessorVO myProInfo(String proNo);
}
