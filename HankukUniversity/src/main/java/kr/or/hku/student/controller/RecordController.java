package kr.or.hku.student.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.student.service.RecordService;
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
	    StudentVO userVo = (StudentVO) session.getAttribute("std");
	    
	    if (userVo == null) {
	        return "redirect:/login";
	    }
	    String userNo = userVo.getStdNo();
	    log.info("userNo: "+ userNo);
	    StudentVO student = service.recordInfo(userNo);
	    if (student == null) {
	        return "redirect:/main/portal";
	    }
	    model.addAttribute("student", student);
	    
	    return "student/record";
	}
	
	@GetMapping(value = "/recordChange")
	public String recordChange(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    StudentVO stdVo = (StudentVO) session.getAttribute("std");
	    
		return "student/recordChange";
	}
}
