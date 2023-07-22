package kr.or.hku.student.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.hku.student.service.RecordService;
import kr.or.hku.student.vo.RecordVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku/student")
public class RecordController {
	
	@Inject
	private RecordService service;
	
	
	@GetMapping(value = "/record")
	public String record(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    StudentVO stdVo = (StudentVO) session.getAttribute("std");
	    
	    if (stdVo == null) {
	        return "redirect:/main/login";
	    }
	    String stdNo = stdVo.getStdNo();
	    log.info("userNo: "+ stdNo);
	    
	    StudentVO student = service.recordInfo(stdNo);
	    List<RecordVO> recordList = service.recordChanged(stdNo);
	    
	    for (RecordVO record : recordList) {
            // RecordVO 객체의 필드를 가져와서 log.info로 출력
            log.info("RecordVO 객체 출력: " + record.toString());
            // 또는, 원하는 필드를 개별적으로 출력할 수도 있습니다.
            log.info("필드1: " + record.getChangeRsn());
            // 필드1, 필드2는 RecordVO에 존재하는 실제 필드명으로 대체되어야 합니다.
        }
	    if (student == null) {
	        return "redirect:/main/portal";
	    }
	    model.addAttribute("student", student);
	    model.addAttribute("recordList", recordList);
	    
	    return "student/record";
	}

	@GetMapping(value = "/gradute")
	public String gradute(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		
		if (stdVo == null) {
			return "redirect:/main/login";
		}
		String stdNo = stdVo.getStdNo();
	    StudentVO student = service.recordInfo(stdNo);
	    if (student == null) {
	        return "redirect:/main/portal";
	    }
	    model.addAttribute("student", student);
		return "student/gradute";
	}
	
	@GetMapping(value = "/recordChange")
	public String recordChange(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		StudentVO userVo = (StudentVO) session.getAttribute("std");
		
		if (userVo == null) {
			return "redirect:/main/login";
		}
		String userNo = userVo.getStdNo();
		log.info("userNo: "+ userNo);
		StudentVO student = service.recordInfo(userNo);
		if (student == null) {
			return "redirect:/main/portal";
		}
		model.addAttribute("student", student);
		
		return "student/recordChange";
	}
	
	// 학적변동 신청내역
	@ResponseBody
	@GetMapping("/recordList")
	public ResponseEntity<List<RecordVO>> recordList(String stdNo) {
		log.info("stdNo: " + stdNo);
		List<RecordVO> list = service.recordList(stdNo);
		for (RecordVO recordVO : list) {
		}
	    
		return new ResponseEntity<List<RecordVO>>(list, HttpStatus.OK);
	}

	// 학적변동 신청내역 삭제
	@ResponseBody
	@PostMapping("/cancelRecord")
	public ResponseEntity<String> cancelRecord(int changeNo) {
		log.info("changeNo: " + changeNo);
		service.cancelRecord(changeNo);
		
		// JSON 형식으로 응답 생성
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonResponse;
	    try {
	        jsonResponse = objectMapper.writeValueAsString("success");
	    } catch (JsonProcessingException e) {
	        log.error("JSON 변환 오류", e);
	        return new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	    
	    return ResponseEntity.ok(jsonResponse);
	}

	
	// 학적변동 기록
	@GetMapping(value = "/recordChanged")
	public String recordChanged(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		
		return "student/recordChange";
	}
	
	// 학적변동 신청
	@ResponseBody
	@PostMapping(value = "/insertAcademic")
	public ResponseEntity<String> insertAcademic(HttpServletRequest request, @RequestBody RecordVO recordVo) {
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		HttpSession session = request.getSession();
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		String stdNo = stdVo.getStdNo();
		recordVo.setStdNo(stdNo);
		log.info("recordVO: " + recordVo.toString());
	    
	    int res = service.insertAcademic(recordVo);
	    
	    log.info("insert status : " + res);
		
		if(res > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}
	
	// 졸업 유예 신청
	@ResponseBody
	@PostMapping(value = "/gradutePostpone")
	public ResponseEntity<String> gradutePostpone(HttpServletRequest request, @RequestBody RecordVO recordVo) {
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		HttpSession session = request.getSession();
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		String stdNo = stdVo.getStdNo();
		recordVo.setStdNo(stdNo);
		log.info("recordVO: " + recordVo.toString());
		
		int res = service.gradutePostpone(recordVo);
		
		log.info("insert status : " + res);
		
		if(res > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}
	
	// 졸업 신청
	@ResponseBody
	@PostMapping(value = "/graduteApply")
	public ResponseEntity<String> graduteApply(HttpServletRequest request, @RequestBody RecordVO recordVo) {
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		HttpSession session = request.getSession();
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		String stdNo = stdVo.getStdNo();
		recordVo.setStdNo(stdNo);
		log.info("recordVO: " + recordVo.toString());
		
		int res = service.insertAcademic(recordVo);
		
		log.info("insert status : " + res);
		
		if(res > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}
	


}
