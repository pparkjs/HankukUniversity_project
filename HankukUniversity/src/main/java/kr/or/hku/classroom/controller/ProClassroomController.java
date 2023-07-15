package kr.or.hku.classroom.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.service.AssignmentService;
import kr.or.hku.classroom.service.ClassroomService;
import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.professor.vo.ProfessorVO;
import lombok.extern.slf4j.Slf4j; 

@Slf4j
@Controller
@RequestMapping("/hku/professor")
public class ProClassroomController {
	
	@Autowired
	private ClassroomService classService;
	
	@Autowired
	private AssignmentService assignService;
	
	@GetMapping("/proClassroomList")
	public String classroom(Model model, HttpServletRequest request) {
		log.info("classroomList 실행 !");
		
		HttpSession session = request.getSession();
		ProfessorVO proVo = (ProfessorVO) session.getAttribute("pro");
		List<LectureAplyVO> list = classService.proSelectList(proVo.getProNo());
		
		model.addAttribute("list", list);
		return "professor/classroomList";
	}
	
	@GetMapping("/classroomMain/{lecapNo}/{subNm}")
	public String enterClass(@PathVariable int lecapNo,
							@PathVariable String subNm,
							Model model,
							HttpSession session) {
		session.setAttribute("lecapNo", lecapNo);
		session.setAttribute("subNm", subNm);
		log.info("개설신청번호 들어와 =>   " + lecapNo);
		List<AssignmentVO> asgList = classService.getClassList(lecapNo);
		log.info(""+asgList);
		model.addAttribute("lecapNo", lecapNo);
		model.addAttribute("subNm", subNm);
		model.addAttribute("asgList", asgList);
		return "professor/classroomMain";
	}
	
	
	// 과제 목록
	@GetMapping("/assignmentList")
	public String assignList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ProfessorVO proVo = (ProfessorVO) session.getAttribute("pro");
		List<AssignmentVO> list =  assignService.assignList(proVo.getProNm());
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
	
	// 과제 등록폼
	@GetMapping("/regiForm")
	public String regiForm(HttpSession session,Model model) {
		int lecapNo = (int) session.getAttribute("lecapNo");
//		AssignmentVO assignVO = assignService.getAssignOne(lecapNo);
		log.info(lecapNo + "");
//		model.addAttribute("assignVO", assignVO);
		return "professor/regiForm";
	}
	
	// 과제 등록
	@PostMapping("/regiAssignment")
	public String regi(AssignmentVO assignVo, Model model) {
		String goPage = "";
		ServiceResult res = assignService.regi(assignVo);
		if(res.equals(ServiceResult.OK)) {
			goPage = "redirect:/hku/professor/assignmentList";
		} else {
			goPage = "/hku/professor/regiForm";
		}
		return goPage;
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
