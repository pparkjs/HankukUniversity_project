package kr.or.hku.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.common.vo.CommonVO;
import kr.or.hku.student.vo.StudentVO;

@Mapper
public interface CommonMapper {
	public List<CommonVO> getAllCommonData();
	public StudentVO myAllInfo(String stdNo);
	public List<FacilityVO> floorListFlct(String flctNo);
}
