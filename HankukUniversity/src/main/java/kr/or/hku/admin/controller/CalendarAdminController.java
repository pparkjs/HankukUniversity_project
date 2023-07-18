package kr.or.hku.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.service.CalendarService;
import kr.or.hku.admin.vo.CalendarVO;
import kr.or.hku.common.service.CommonService;
import kr.or.hku.common.vo.CommonVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hku/admin")
@Slf4j
public class CalendarAdminController {

	@Autowired
	private CommonService commonService;
	
	@Autowired
	private CalendarService calendarService;
	
	@GetMapping("/calendar")
	public String adminCalendar(Model model) {
		List<CommonVO> commonData = commonService.getAllCommonData();
		List<Map<String, String>> deptList = calendarService.getDeptList();
		List<CalendarVO> curCalendarList = calendarService.getCurrentCalendar();
		model.addAttribute("commonData", commonData);
		model.addAttribute("deptList", deptList);
		log.info(deptList.toString());
		model.addAttribute("curCalendarList", curCalendarList);
		return "admin/calendar";
	}
	
	@ResponseBody
	@GetMapping("/calendar-list")
	public List<CalendarVO> getCalendarList(@RequestParam Map<String, String> map){
		log.info("조회 구분" + map.toString());
		List<CalendarVO> calList = calendarService.getCalendarList(map);
		return calList;
	}
	
	@ResponseBody
	@PostMapping("/calendar")
	public CalendarVO addCalendar(@RequestBody CalendarVO calendarVO) {
		log.info("일정 전달된 데이터 > " + calendarVO.toString());
		
		int res = calendarService.addCalendar(calendarVO);
		// 데이터 삽입 성공하면 기본키 생성됨
		return calendarVO;
	}
	
	@ResponseBody
	@PutMapping("/calendar")
	public int changeCalendar(@RequestBody CalendarVO calendarVO) {
		log.info("변경 일어날떄 데이터 > " + calendarVO.toString());
		
		int res = calendarService.changeCalendar(calendarVO);
		
		return res;
	}
	
	@ResponseBody
	@DeleteMapping("/calendar")
	public int deleteCalendar(@RequestBody Map<String, String> map) {
		log.info("삭제 할떄 하는 데이터 " + map.toString());
		
		int res = calendarService.deleteCalendar(map);
		
		return res;
	}
	
	
	@ResponseBody
	@GetMapping("/getCalendarInfoList")
	public List<CalendarVO> getCalendarInfoList(CalendarVO calendarVO){
		log.info("날짜별로 데이터 가져오기" + calendarVO.toString());
		
		List<CalendarVO> calList = calendarService.getCalendarInfoList(calendarVO);
		
		return calList;
	}
}
