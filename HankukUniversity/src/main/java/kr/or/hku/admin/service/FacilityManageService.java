package kr.or.hku.admin.service;

import java.util.List;

import kr.or.hku.admin.vo.FacilitiesVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.admin.vo.FlctFloorVO;
import kr.or.hku.admin.vo.NextCodeVO;
import kr.or.hku.common.vo.SearchInfoVO;

public interface FacilityManageService {

	public List<FacilityVO> selectFcltList(SearchInfoVO searchInfoVO);

	public List<FacilitiesVO> selectFcltsList(SearchInfoVO searchInfoVO);

	public List<FacilitiesVO> selectFcltRsvList(SearchInfoVO searchInfoVO);

	public NextCodeVO flctNoSet();

	public int flctInsert(FacilityVO flctVO);

	public int deleteFlct(String flctNo);

	public FacilityVO selectFlct(String flctNo);

	public int insertFloor(FlctFloorVO flctFloorVO);

	public int deleteFloor(String flctNo);

	public int updateFlct(FacilityVO flctVO);

	public List<FacilityVO> flctsModalSelectBoxSet();

}
