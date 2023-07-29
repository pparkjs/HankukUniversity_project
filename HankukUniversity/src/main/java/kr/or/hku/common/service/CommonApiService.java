package kr.or.hku.common.service;

import java.util.List;

import kr.or.hku.common.vo.ApiVO;

public interface CommonApiService {
	public List<ApiVO> getApiId(String apiType);
}
