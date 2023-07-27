package kr.or.hku.portal.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.portal.mapper.WeatherMapper;
import kr.or.hku.portal.service.WeatherService;
@Service
public class WeatherServiceImpl implements WeatherService {

	@Autowired
	WeatherMapper weatherMapper;
	
	
	@Override
	public String getApiKey() {
		return weatherMapper.getApiKey();
	}
}
