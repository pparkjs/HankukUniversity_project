package kr.or.hku.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.student.vo.LockerRsvtVO;
import kr.or.hku.student.vo.LockerVO;

@Mapper
public interface FacilityMapper {
	public List<LockerVO> lockerList(Map<String, Object> map);
	public void lockerYnUpdate(LockerRsvtVO locker);
	public int lockerReservation(LockerRsvtVO locker);
	public int lockerReservationCheck(LockerRsvtVO locker);
}
