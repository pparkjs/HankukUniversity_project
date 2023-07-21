package kr.or.hku.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.FacilitiesVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.admin.vo.FlctFloorVO;
import kr.or.hku.admin.vo.NextCodeVO;
import kr.or.hku.common.vo.SearchInfoVO;

@Mapper
public interface FacilityManageMapper {

	public List<FacilityVO> selectFcltList(SearchInfoVO searchInfoVO);

	public List<FacilitiesVO> selectFcltsList(SearchInfoVO searchInfoVO);

	public List<FacilitiesVO> selectFcltRsvList(SearchInfoVO searchInfoVO);

	public NextCodeVO flctNoSet();

	public int flctInsert(FacilityVO flctVO);

	public int deleteFlct(String flctNo);

	public FacilityVO selectFlct(String flctNo);

	public int insertFloor(FlctFloorVO flctFloorVO);

	public int deleteFloor(String flctNo);

	public int selectFlctFloor(String flctNo);

	public int updateFlct(FacilityVO flctVO);

	public List<FacilityVO> flctsModalSelectBoxSet();

	public NextCodeVO flctsNoSet();

	public int flctsInsert(FacilitiesVO flctsVO);

	public int deleteFlcts(String flctsNo);

	public FacilitiesVO selectFlcts(String flctsNo);

	public int updateFlcts(FacilitiesVO flctsVO);

	public int deleteFlctsRsvt(String flctsRsvtNo);

}
