package kr.or.hku.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.hku.admin.mapper.CalendarMapper;
import kr.or.hku.admin.service.CalendarService;
import kr.or.hku.admin.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarMapper calendarMapper;
	
	@Override
	public List<CalendarVO> getCurrentCalendar() {
		return calendarMapper.getCurrentCalendar();
	}
	
	@Override
	public List<CalendarVO> getCalendarList(Map<String, String> map) {
		return calendarMapper.getCalendarList(map);
	}
	
	@Override
	public int addCalendar(CalendarVO calendarVO) {
		return calendarMapper.addCalendar(calendarVO);
	}
	
	@Override
	public int changeCalendar(CalendarVO calendarVO) {
		return calendarMapper.changeCalendar(calendarVO);
	}
	
	@Override
	public int deleteCalendar(Map<String, String> map) {
		return calendarMapper.deleteCalendar(map);
	}
	
	@Override
	public List<CalendarVO> getCalendarInfoList(CalendarVO calendarVO) {
		return calendarMapper.getCalendarInfoList(calendarVO);
	}
	
	@Override
	public List<Map<String, String>> getDeptList() {
		return calendarMapper.getDeptList();
	}
}
