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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.student.service.StudyService;
import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.StudyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku/student")
public class StudyBoardController {
	
	@Inject
	private StudyService service;
	
	
	@GetMapping(value = "/studyBoard")
	public String studyBoard(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    StudentVO stdVo = (StudentVO) session.getAttribute("std");
	    
	    if (stdVo == null) {
	        return "redirect:/main/login";
	    }
	    String stdNo = stdVo.getStdNo();
	    log.info("userNo: "+ stdNo);
	    List<StudyVO> myStudy = service.myStudy(stdNo);
	    List<StudyVO> list =  service.studyBoardList();
	    String stdNm = stdVo.getStdNm();
	    model.addAttribute("list", list);
	    model.addAttribute("myStudy", myStudy);
	    model.addAttribute("stdNm", stdNm);
	    return "portal/studyBoard";
	}
	
	@ResponseBody
	@GetMapping("/studyBoardList")
	public ResponseEntity<List<StudyVO>> studyBoardList() {
		List<StudyVO> list = service.studyBoardList();
	    
		return new ResponseEntity<List<StudyVO>>(list, HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping("/studyBoardDetail")
	public ResponseEntity<StudyVO> studyBoardDetail(@RequestParam("stboNo") int stboNo) {
		StudyVO stbo = service.studyBoardDetail(stboNo);
	    
		return new ResponseEntity<StudyVO>(stbo,HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value = "/insertStudyBoard")
	public ResponseEntity<String> insertStudyBoard( @RequestBody StudyVO studyVo) {
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    
	    int res = service.insertStudyBoard(studyVo);
	    
	    log.info("insert status : " + res);
		
		if(res > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}

	@ResponseBody
	@PostMapping(value = "/deleteStudyBoard")
	public ResponseEntity<Integer> deleteStudyBoard(@RequestParam("stboNo") int stboNo) {
		int res = service.deleteStudyBoard(stboNo);
	    
		return new ResponseEntity<Integer>(res,HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value = "/modifyStudyBoard")
	public ResponseEntity<String> modifyStudyBoard(@RequestBody StudyVO studyVo) {
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    
	    int res = service.modifyStudyBoard(studyVo);
		
		if(res > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}

	@ResponseBody
	@PostMapping(value = "/intoStudy")
	public ResponseEntity<String> intoStudy(@RequestBody StudyVO studyVo, HttpServletRequest request) {
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		HttpSession session = request.getSession();
	    StudentVO stdVo = (StudentVO) session.getAttribute("std");
	  
	    String stdNo = stdVo.getStdNo();
	    studyVo.setStdNo(stdNo);
	    log.info(studyVo.getStdNo());
	    log.info(""+studyVo.getStudyNo());
	    log.info(studyVo.getJoinReason());
	    
		int res = service.intoStudy(studyVo);
		
		if(res > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		
		return entity;
	}

}
