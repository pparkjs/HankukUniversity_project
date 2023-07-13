package kr.or.hku.student.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.ServiceResult;
import kr.or.hku.student.vo.LockerRsvtVO;
import kr.or.hku.student.vo.LockerVO;

public interface FacilityService {
	public List<LockerVO> lockerList(Map<String, Object> map);
	public ServiceResult lockerReservation(LockerRsvtVO locker);
}
