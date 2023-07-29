package kr.or.hku.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.common.vo.ApiVO;

@Mapper
public interface CommonApiMapper {
	public List<ApiVO> getApiId(String apiType);
}
