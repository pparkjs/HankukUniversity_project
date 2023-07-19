package kr.or.hku.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.CalendarVO;

@Mapper
public interface CalendarMapper {
	public List<CalendarVO> getCalendarList();
	public int addCalendar(CalendarVO calendarVO);
}
