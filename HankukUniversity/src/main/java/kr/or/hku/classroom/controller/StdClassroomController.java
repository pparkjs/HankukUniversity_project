package kr.or.hku.classroom.controller;

import java.util.HashMap;
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

import kr.or.hku.classroom.service.AssignmentService;
import kr.or.hku.classroom.service.AttendanceService;
import kr.or.hku.classroom.service.ClassroomService;
import kr.or.hku.classroom.service.LectureNoticeService;
import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.AttendanceVO;
import kr.or.hku.classroom.vo.ClassroomVO;
import kr.or.hku.classroom.vo.LectureNoticeVO;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.student.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hku/student")
public class StdClassroomController {
	
	@Autowired
	private ClassroomService classService;
	
	@Autowired
	private AssignmentService assignService;
	
	@Autowired
	private AttendanceService attendanceService;
	@Autowired
	private LectureNoticeService noticeService;
	@Autowired
	private CommonFileService fileService;
	// 클래스룸 리스트 
	@GetMapping("/stdClassroomList")
	public String classroomList(Model model, HttpServletRequest request) {
		log.info("classroomList 실행 !");
		HttpSession session = request.getSession();
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		List<ClassroomVO> list = classService.stdSelectList(stdVo.getStdNo());
		model.addAttribute("list", list);
		return "student/classroomList";
	}
	
	// 클래스룸 메인
	@GetMapping("/stdClassroomMain/{lecapNo}")
	public String classroomMain(@PathVariable String lecapNo
								, HttpSession session
								, Model model) {
		String subNm = classService.getSubNm(lecapNo);
		session.setAttribute("lecapNo", lecapNo);
		session.setAttribute("subNm", subNm);
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		log.info("개설신청번호는!!!!!!!!! =>   " + lecapNo);
		
		// 쿼리 조회할 변수 저장 
		Map<String, String> map = new HashMap<String, String>();
		map.put("lecapNo", lecapNo);
		map.put("stdNo", stdVo.getStdNo());
		log.info("stdNo" + stdVo.getStdNo());

		// 공지사항, 과제, 출석 정보를 맵에 담은 변수를 통해 가져옴 
		List<AssignmentVO> list = classService.stdMainAssignList(map);
		List<AttendanceVO> attendList = classService.getMyAttendance(map);
		List<LectureNoticeVO> noticeList = noticeService.getNoticeList(lecapNo);
		log.info("list!!!!!!!=>" + list.toString());
		model.addAttribute("list", list);
		model.addAttribute("attendList", attendList);
		model.addAttribute("noticeList", noticeList);
		return "student/classroomMain";
	}
	
//	// 과제 목록
//	@GetMapping("stdAssignmentList/{lecapNo}")
//	public String stdAssignmentList(@PathVariable String lecapNo,									
//									Model model) {
//		List<AssignmentVO> asmList = classService.stdMainAssignList(lecapNo);
//		log.info("lecapNo=======>", lecapNo);     
//		model.addAttribute("asmList", asmList);
//		return "student/stdAssignmentList";
//	}
	
	// 출석 이의신청 
	@GetMapping("/attendanceDmr/{lecapNo}")
	public String attendanceDmr(@PathVariable String lecapNo
								, Model model) {
		return "student/attendanceDmr";
	}
	
	@GetMapping("/noticeList")
	public String noticeList(HttpSession session, Model model) {
		String lecapNo = session.getAttribute("lecapNo").toString();
		List<LectureNoticeVO> noticeList = noticeService.getNoticeList(lecapNo);
		model.addAttribute("noticeList", noticeList);
		return "student/lectureNoticeList";
	}
	
	//학생클래스룸 공지상세 페이지
		@GetMapping("/detailNotice/{lecntNo}")
		public String detailNotice(@PathVariable int lecntNo,Model model) {
			LectureNoticeVO noticeVO = noticeService.getNotcieDetail(lecntNo);
			List<AttachFileVO> fileList = fileService.getFileList(noticeVO.getAtchFileNo());
			noticeVO.setFileList(fileList);
			log.info("디테일가져왔냐!!!!!"+noticeVO.toString());
			model.addAttribute("noticeVO",noticeVO);
			return "student/lectureNoticeDetail";
		}
	
}
