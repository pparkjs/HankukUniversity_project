package kr.or.hku.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
		model.addAttribute("commonData", commonData);
		return "admin/calendar";
	}
	
	@ResponseBody
	@GetMapping("/calendar-list")
	public List<CalendarVO> getCalendarList(){
		List<CalendarVO> calList = calendarService.getCalendarList();
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
}
