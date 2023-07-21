package kr.or.hku.admin.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.common.vo.SearchInfoVO;
import kr.or.hku.student.vo.LockerRsvtVO;
import kr.or.hku.student.vo.LockerVO;

@Mapper
public interface LockerMapper {

	public List<FacilityVO> getFlctList();

	public List<String> floorSet(String flctNo);

	public List<LockerVO> selectLockers(SearchInfoVO searchInfoVO);

	public List<LockerRsvtVO> selectLockerRsvts(SearchInfoVO searchInfoVO);

	public int insertLocker(LockerVO lockerVO);

	public void deleteLockerRsvt(HashMap<String, String> delLocker);

	public int deleteLocker(HashMap<String, String> delLocker);

	public int btnSwitch(HashMap<String, String> kywData);

	public int rsvtBtnSwitch(HashMap<String, String> kywkywData);

}
