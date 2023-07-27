package kr.or.hku.portal.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WeatherMapper {
	public String getApiKey();

}
