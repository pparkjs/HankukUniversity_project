package kr.or.hku.admin.service;

import java.util.List;

import kr.or.hku.admin.vo.CalendarVO;

public interface CalendarService {
	public List<CalendarVO> getCalendarList();
	public int addCalendar(CalendarVO calendarVO);
}
