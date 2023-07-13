package kr.or.hku.classroom.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.classroom.service.ClassroomListService;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.professor.vo.ProfessorVO;
import lombok.extern.slf4j.Slf4j; 

@Slf4j
@Controller
@RequestMapping("/hku/professor")
public class ProClassroomController {
	
	@Autowired
	private ClassroomListService service;
	
	@GetMapping("/proClassroomList")
	public String classroom(Model model, HttpServletRequest request) {
		log.info("classroomList 실행 !");
		
		HttpSession session = request.getSession();
		ProfessorVO proVo = (ProfessorVO) session.getAttribute("pro");
		List<LectureAplyVO> list = service.proSelectList(proVo.getProNo());
		
		model.addAttribute("list", list);
		return "professor/classroomList";
	}
	
	@GetMapping("/classroomMain/{lecApNo}")
	public String enterClass(@PathVariable("lecApNo") int lecApNo
							, Model model) {
		log.info("개설신청번호 들어와 =>   " + lecApNo);
//	    ClassroomVO clRoom = 
		
		return "professor/classroomMain";
	}
}
