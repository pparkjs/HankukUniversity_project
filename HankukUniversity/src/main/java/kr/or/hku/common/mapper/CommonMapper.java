package kr.or.hku.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.common.vo.CommonVO;

@Mapper
public interface CommonMapper {
	public List<CommonVO> getAllCommonData();
}
