package kr.or.hku.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.hku.admin.vo.CalendarVO;

@Mapper
public interface CalendarMapper {
	public List<CalendarVO> getCalendarList(Map<String, String> map);
	public int addCalendar(CalendarVO calendarVO);
	public int changeCalendar(CalendarVO calendarVO);
	public int deleteCalendar(Map<String, String> map);
	public List<CalendarVO> getCurrentCalendar();
	public List<CalendarVO> getCalendarInfoList(CalendarVO calendarVO);
	public List<Map<String, String>> getDeptList();
}
