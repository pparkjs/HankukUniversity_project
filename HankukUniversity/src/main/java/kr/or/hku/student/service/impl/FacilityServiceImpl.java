package kr.or.hku.student.service.impl;

import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.hku.ServiceResult;
import kr.or.hku.admin.vo.FacilitiesVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.student.mapper.FacilityMapper;
import kr.or.hku.student.service.FacilityService;
import kr.or.hku.student.vo.LockerRsvtVO;
import kr.or.hku.student.vo.LockerVO;

@Service
public class FacilityServiceImpl implements FacilityService {

	@Autowired
	private FacilityMapper facilityMapper;
	
	@Override
	public List<LockerVO> lockerList(Map<String, Object> map) {
		return facilityMapper.lockerList(map);
	}

	@Transactional(rollbackFor = SQLSyntaxErrorException.class)
	@Override
	public ServiceResult lockerReservation(LockerRsvtVO locker) {
		ServiceResult result = null;
		
		int check = facilityMapper.lockerReservationCheck(locker);
		
		// 이미 해당 년도 해당 학기에 내가 신청한 사물함이 있을 시 실행
		if(check > 0) {
			result = ServiceResult.EXIST;
		}else {
			facilityMapper.lockerYnUpdate(locker);
			
			int cnt = facilityMapper.lockerReservation(locker);
			
			// 사물함 예약 신청 성공시 실행
			if(cnt > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}
		return result;
	}

	@Override
	public List<FacilitiesVO> fcltsList(Map<String, Object> map) {
		return facilityMapper.fcltsList(map);
	}

	@Override
	public List<FacilitiesVO> rsvtList(Map<String, Object> map) {
		return facilityMapper.rsvtList(map);
	}

	@Override
	public ServiceResult flctsReservation(FacilitiesVO vo) {
		ServiceResult result = null;
		
//		int check = facilityMapper.flctsReservationCheck(vo);
		
		int cnt = facilityMapper.flctsReservation(vo);
		
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

}
