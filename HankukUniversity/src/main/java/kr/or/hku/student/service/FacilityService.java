package kr.or.hku.student.service;

import java.util.List;
import java.util.Map;

import kr.or.hku.ServiceResult;
import kr.or.hku.admin.vo.FacilitiesVO;
import kr.or.hku.student.vo.LockerRsvtVO;
import kr.or.hku.student.vo.LockerVO;

public interface FacilityService {
	public List<LockerVO> lockerList(Map<String, Object> map);
	public ServiceResult lockerReservation(LockerRsvtVO locker);
	public List<FacilitiesVO> fcltsList(Map<String, Object> map);
	public List<FacilitiesVO> rsvtList(Map<String, Object> map);
	public ServiceResult flctsReservation(FacilitiesVO vo);
	public List<FacilitiesVO> getFlctsRsvtList(String stdNo);
	public List<LockerRsvtVO> getLockerRsvtList(String stdNo);
	public ServiceResult lockerCancle(LockerRsvtVO vo);
	public ServiceResult flctsCancle(String flctsRsvtNo);
}
