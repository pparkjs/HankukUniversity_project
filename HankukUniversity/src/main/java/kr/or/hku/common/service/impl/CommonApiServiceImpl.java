package kr.or.hku.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.common.mapper.CommonApiMapper;
import kr.or.hku.common.service.CommonApiService;
import kr.or.hku.common.vo.ApiVO;

@Service
public class CommonApiServiceImpl implements CommonApiService {
	
	@Autowired
	private CommonApiMapper apiMapper;
	
	@Override
	public List<ApiVO> getApiId(String apiType) {
		return apiMapper.getApiId(apiType);
	}
}
