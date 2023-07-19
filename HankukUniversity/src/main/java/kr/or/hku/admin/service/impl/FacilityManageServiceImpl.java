package kr.or.hku.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.mapper.FacilityManageMapper;
import kr.or.hku.admin.service.FacilityManageService;
import kr.or.hku.admin.vo.FacilitiesVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.admin.vo.FlctFloorVO;
import kr.or.hku.admin.vo.NextCodeVO;
import kr.or.hku.common.vo.SearchInfoVO;

@Service
public class FacilityManageServiceImpl implements FacilityManageService {
	
	@Autowired
	private FacilityManageMapper mapper;

	@Override
	public List<FacilityVO> selectFcltList(SearchInfoVO searchInfoVO) {
		return mapper.selectFcltList(searchInfoVO);
	}

	@Override
	public List<FacilitiesVO> selectFcltsList(SearchInfoVO searchInfoVO) {
		return mapper.selectFcltsList(searchInfoVO);
	}

	@Override
	public List<FacilitiesVO> selectFcltRsvList(SearchInfoVO searchInfoVO) {
		return mapper.selectFcltRsvList(searchInfoVO);
	}

	@Override
	public NextCodeVO flctNoSet() {
		return mapper.flctNoSet();
	}

	@Override
	public int flctInsert(FacilityVO flctVO) {
		return mapper.flctInsert(flctVO);
	}

	@Override
	public int deleteFlct(String flctNo) {
		return mapper.deleteFlct(flctNo);
	}

	@Override
	public FacilityVO selectFlct(String flctNo) {
		FacilityVO flctVO = mapper.selectFlct(flctNo);
		String flctClsfCd = flctVO.getFlctClsfCd();
		
		if(flctClsfCd.equals("clsf01")) {
			int floor = mapper.selectFlctFloor(flctVO.getFlctNo());
			flctVO.setFloor(floor);
			return flctVO;
		} else {
			return flctVO;
		}
		
	}

	@Override
	public int insertFloor(FlctFloorVO flctFloorVO) {
		return mapper.insertFloor(flctFloorVO);
	}

	@Override
	public int deleteFloor(String flctNo) {
		return mapper.deleteFloor(flctNo);
	}

	@Override
	public int updateFlct(FacilityVO flctVO) {
		// 수정
		int successFlag = 1;
		
		int modStatus = mapper.updateFlct(flctVO);
		if(modStatus == 0) {
			successFlag = 0;
		}
		mapper.deleteFloor(flctVO.getFlctNo());
		
		String flctClsfCd = flctVO.getFlctClsfCd();
		if(flctClsfCd.equals("clsf01")) {
			
			int floor = flctVO.getFloor();
			
			FlctFloorVO flctFloorVO = new FlctFloorVO();
			flctFloorVO.setFlctNo(flctVO.getFlctNo());
			for(int i=1; i<=floor; i++) {
				flctFloorVO.setFloor(i);
				int insertFloorStatus = mapper.insertFloor(flctFloorVO);
				if(insertFloorStatus == 0) {
					successFlag = 0;
				}
			}
		}
		return successFlag;
	}

	@Override
	public List<FacilityVO> flctsModalSelectBoxSet() {
		return mapper.flctsModalSelectBoxSet();
	}

}
