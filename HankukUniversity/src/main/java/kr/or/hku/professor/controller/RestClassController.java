package kr.or.hku.professor.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.ServiceResult;
import kr.or.hku.lectureInfo.vo.LectureTimeTableVO;
import kr.or.hku.professor.service.RestClassService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku/professor")
public class RestClassController {
	
	@Autowired
	RestClassService restClassService;
	
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/restClass")
	public String goRestPage() {
		return "professor/restClass";
	}
	
	@GetMapping("/myTimeTable")
	@ResponseBody
	public List<LectureTimeTableVO> getMyTimetable(String proNo){
		List<LectureTimeTableVO> myTimetable = restClassService.getMyTimetable(proNo);
		return myTimetable;
	}
	
	@PostMapping(value="/setRestTable")
	@ResponseBody
	public LectureTimeTableVO setRestTable(@RequestBody Map<String,String> myMap){
		log.info("내 데이터 들어오니?" + myMap.toString());
		LectureTimeTableVO myTime = restClassService.setRestTable(myMap);
		return myTime;
	}
	@PostMapping(value="/insertRestTable")
	@ResponseBody
	public ServiceResult insertRestTable(@RequestBody Map<String,String> myMap){
		log.info("내 데이터 들어오니?" + myMap.toString());
		ServiceResult result = restClassService.insertRestTable(myMap);
		return result;
	}
	@PostMapping(value="/ifSameData")
	@ResponseBody
	public int ifSameData(@RequestBody Map<String,String> myMap){
		int result = restClassService.ifSameData(myMap);
		return result;
	}
	@GetMapping(value="/deleteRestTable")
	@ResponseBody
	public int deleteRestTable(String subclNo){
		int result = restClassService.deleteRestTable(subclNo);
		return result;
	}
	
	

}
