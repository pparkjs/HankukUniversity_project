package kr.or.hku.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.FacilitiesVO;
import kr.or.hku.student.vo.LockerRsvtVO;
import kr.or.hku.student.vo.LockerVO;

@Mapper
public interface FacilityMapper {
	public List<LockerVO> lockerList(Map<String, Object> map);
	public void lockerYnUpdate(LockerRsvtVO locker);
	public int lockerReservation(LockerRsvtVO locker);
	public int lockerReservationCheck(LockerRsvtVO locker);
	public List<FacilitiesVO> fcltsList(Map<String, Object> map);
	public List<FacilitiesVO> rsvtList(Map<String, Object> map);
	public int flctsReservation(FacilitiesVO vo);
//	public int flctsReservationCheck(FacilitiesVO vo);
}
