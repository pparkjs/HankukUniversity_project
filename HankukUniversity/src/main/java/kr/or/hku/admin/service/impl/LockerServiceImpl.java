package kr.or.hku.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.mapper.LockerMapper;
import kr.or.hku.admin.service.LockerService;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.common.vo.SearchInfoVO;
import kr.or.hku.student.vo.LockerRsvtVO;
import kr.or.hku.student.vo.LockerVO;

@Service
public class LockerServiceImpl implements LockerService {
	
	@Autowired
	private LockerMapper mapper;

	@Override
	public List<FacilityVO> getFlctList() {
		return mapper.getFlctList();
	}

	@Override
	public List<String> floorSet(String flctNo) {
		return mapper.floorSet(flctNo);
	}

	@Override
	public List<LockerVO> selectLockers(SearchInfoVO searchInfoVO) {
		return mapper.selectLockers(searchInfoVO);
	}

	@Override
	public List<LockerRsvtVO> selectLockerRsvts(SearchInfoVO searchInfoVO) {
		return mapper.selectLockerRsvts(searchInfoVO);
	}

	@Override
	public int insertLocker(LockerVO lockerVO) {
		return mapper.insertLocker(lockerVO);
	}

	@Override
	public int deleteLocker(HashMap<String, String> delLocker) {
		mapper.deleteLockerRsvt(delLocker);
		return mapper.deleteLocker(delLocker);
	}

	@Override
	public int btnSwitch(HashMap<String, String> kywData) {
		return mapper.btnSwitch(kywData);
	}

	@Override
	public int rsvtBtnSwitch(HashMap<String, String> kywkywData) {
		return mapper.rsvtBtnSwitch(kywkywData);
	}

}
