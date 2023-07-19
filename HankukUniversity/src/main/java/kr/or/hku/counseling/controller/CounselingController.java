package kr.or.hku.counseling.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.ServiceResult;
import kr.or.hku.counseling.service.CounselingService;
import kr.or.hku.counseling.vo.CounselingRsvtVO;
import kr.or.hku.lectureInfo.vo.LectureScheduleVO;
import kr.or.hku.professor.vo.ProfessorVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku")
public class CounselingController {
	
	@Autowired
	private CounselingService counselingService;
	
	@GetMapping("/counseling-req")
	public String counselingForm() {
		return "student/counseling-req";
	}
	
	@ResponseBody
	@GetMapping("/getProList/{deptCd}")
	public ResponseEntity<List<ProfessorVO>> getProList(@PathVariable("deptCd") String deptCd){
		List<ProfessorVO> list = counselingService.getProList(deptCd);
		return new ResponseEntity<List<ProfessorVO>>(list, HttpStatus.OK);
	}
	
	// 교수의 스케쥴 가져오기
	@ResponseBody
	@GetMapping("/getScheduleList/{proNo}")
	public ResponseEntity<Map<String, Object>> getScheduleList(@PathVariable("proNo") String proNo){
		log.info("교수번호 : " + proNo);
		List<LectureScheduleVO> lecList = counselingService.getLecList(proNo);
		List<CounselingRsvtVO> counseList = counselingService.getCounseList(proNo);
		
		log.info("강의시간표 : " + lecList);
		log.info("상담시간표 : " + counseList);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lecture", lecList);
		map.put("counse", counseList);
		
		log.info("맵 : " + map);
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}

	// 상담 예약하기
	@ResponseBody
	@PostMapping("/counseling-rsvt")
	public ResponseEntity<String> counselingRsvt(@RequestBody CounselingRsvtVO vo){
		log.info("상담예약 : "  + vo);
		ServiceResult result = counselingService.counselingRsvt(vo);
		
		if(result.equals(ServiceResult.OK)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed", HttpStatus.OK);
		}
	}
	
	@GetMapping("/counseling-record")
	public String counselingRecord() {
		return "student/counseling-record";
	}
}
