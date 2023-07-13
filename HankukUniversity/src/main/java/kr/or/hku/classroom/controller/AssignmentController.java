package kr.or.hku.classroom.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.classroom.service.AssignmentService;
import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.professor.vo.ProfessorVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku/professor")
public class AssignmentController {
	
	@Autowired
	private AssignmentService service;
	
	
	// 과제 목록
	@GetMapping("/assignmentList")
	public String assignList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ProfessorVO proVo = (ProfessorVO) session.getAttribute("pro");
		List<AssignmentVO> list =  service.assignList(proVo.getProNm());
		model.addAttribute("list", list);
		return "professor/assignmentList";
	}
	
	// 과제 상세 
	@GetMapping("/assignmentDetail")
	public String detail(Model model) {
		 ClassroomVO classroomVO = new ClassroomVO();
		 model.addAttribute("vo", classroomVO);
		return "professor/assignmentDetail";
	}
	
	// 과제 등록
	@PostMapping("/regiAssignment")
	public String regi() {
		return "professor/regiAssignment";
	}
	
	// 과제수정
	@PostMapping("/updateAssignment")
	public String update() {
		return "professor/updateAssignment";
	}
	
	// 과제삭제 
	@PostMapping("/deleteAssignment")
	public String delete(String proNo) {
		return "professor/assignmentList";
	}
}
