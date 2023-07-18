package kr.or.hku.classroom.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.classroom.service.ClassroomService;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku/student")
public class StdClassroomController {
	
	@Autowired
	private ClassroomService service;
	
	@GetMapping("/stdClassroomList")
	public String classroomList(Model model, HttpServletRequest request) {
		log.info("classroomList 실행 !");
		
		HttpSession session = request.getSession();
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		List<ClassroomVO> list = service.selectList(stdVo.getStdNo());
		
		model.addAttribute("list", list);
		return "student/classroomList";
	}
	
	@GetMapping("/attendanceDmr" )
	public String attendanceDmr() {
		return "student/attendanceDmr";
	}
	
}
