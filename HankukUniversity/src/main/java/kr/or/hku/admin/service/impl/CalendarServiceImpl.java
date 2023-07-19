package kr.or.hku.admin.service.impl;

import java.util.List;

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
	public List<CalendarVO> getCalendarList() {
		return calendarMapper.getCalendarList();
	}
	
	@Override
	public int addCalendar(CalendarVO calendarVO) {
		return calendarMapper.addCalendar(calendarVO);
	}
}
