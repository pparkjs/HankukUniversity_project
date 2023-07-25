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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.ServiceResult;
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
	private CommonFileService fileService;
	
	@Autowired
	private LectureNoticeService noticeService;
	
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
	
	// 과제 목록
	@GetMapping("stdAssignmentList/{lecapNo}")
	public String stdAssignmentList(@PathVariable String lecapNo,
									HttpSession session,
									Model model) {
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		Map<String, String> map = new HashMap<String, String>();
		map.put("lecapNo", lecapNo);
		map.put("stdNo", stdVo.getStdNo());
		
		List<AssignmentVO> asmList = classService.stdMainAssignList(map);
		log.info("lecapNo=======>"+ lecapNo);     
		model.addAttribute("asmList", asmList);
		return "student/assignmentList";
	}
	
	// 과제 상세보기 
	@GetMapping("/assignmentDetail/{asmNo}")
	public String stdAssignDetail(@PathVariable String asmNo,
										Model model,
										HttpSession session) {
		log.info("asmNo : " + asmNo);
		StudentVO std = (StudentVO)session.getAttribute("std");
		
		AssignmentVO vo = new AssignmentVO();
		
		vo.setAsmNo(asmNo);
		vo.setStdNo(std.getStdNo());
		
		AssignmentVO assignVo = assignService.stdAssignDetail(vo);
		int atchFileNo = assignVo.getAtchFileNo();
		// 여기서 정보가 없으면 null 있으면 어떤 값이 들어간다.
		List<AttachFileVO> fileList = fileService.getFileList(atchFileNo);
		assignVo.setFileList(fileList);
		model.addAttribute("assignVo", assignVo);
		log.info("proNm!!!" + assignVo.toString());
		return "student/assignmentDetail";
	}
	
	// 학생 과제 제출
	@PostMapping("/assignmentDetail/{asmNo}")
	public String assignmentSubmit(HttpSession session, AssignmentVO vo, Model model) {
		int attachFileNo = fileService.getAttachFileNo();
		System.out.println("여기야여기"+vo.toString());
		StudentVO std = (StudentVO) session.getAttribute("std");   
		vo.setStdNo(std.getStdNo());
		fileService.insertFile(vo.getAssignFile(), attachFileNo, 0);
		vo.setAtchFileNo(attachFileNo);
		
		int res = assignService.assignmentSubmit(vo);
		if(res > 0) {
			return "redirect:/hku/student/stdAssignmentList/" + vo.getLecapNo();
		} else {
			model.addAttribute("assignVo", vo);
			return "student/assignmentDetail" ;
		}
	}
	
	// 출석 이의신청 
	@GetMapping("/attendanceDmr")
	public String attendanceDmr(Model model, HttpSession session) {
		// 이의신청 리스트 가져오기
		log.info("여기가 뭐냐면" + "");
		StudentVO std = (StudentVO) session.getAttribute("std");
		String lecapNo = (String) session.getAttribute("lecapNo");
		AttendanceVO vo = new AttendanceVO();
		vo.setStdNo(std.getStdNo());
		vo.setLecapNo(lecapNo);
		List<AttendanceVO> attendDmrList = attendanceService.attenDmrList(vo);
		model.addAttribute("attendDmrList", attendDmrList);
		return "student/attendanceDmr";
	}
	
	// 출석번호 가져오기 
	@ResponseBody
	@PostMapping("/getAtdcNo")
	public Map<String, Object> getAtdcNo(@RequestBody AttendanceVO attend) {
		log.info("얍!" + attend);
		Map<String, Object> map = attendanceService.getAtdcNo(attend);
		log.info("여기여기" + map.toString());
		return map;
	}
	
	// 이의신청 완료
	@ResponseBody
	@PostMapping("/submitAttendDmr")
	public String submitAttendDmr(AttendanceVO vo) {
		log.info("여기에 뭐가 오냐면" + vo.toString());
		int atchFileNo = fileService.getAttachFileNo();
		fileService.insertFile(vo.getAttendanceFile(), atchFileNo, 0);
		log.info("파일 저장 성공 ? " + atchFileNo);
		vo.setAtchFileNo(atchFileNo);
		ServiceResult result = attendanceService.submitAttendDmr(vo);
		
		if(result.equals(ServiceResult.EXIST)){
			return "exist";
		}else if(result.equals(ServiceResult.OK)){
			return "success";
		}else{
			return "failed";
		}
	}
	
	//이의신청 상세
	@ResponseBody
	@PostMapping("/attendDmrDetail")
	public AttendanceVO dmrDetail(@RequestBody HashMap<String, String> atdcNoMap) {
		System.out.println("duel!!!"+atdcNoMap);
		int atdcNo = Integer.parseInt(atdcNoMap.get("atdcNo"));
		log.info("atdcNo : " + atdcNo);
		AttendanceVO attendVo = attendanceService.dmrDetail(atdcNo);
		log.info("attendVo : " + attendVo.toString());
		return attendVo;
	}
	
	// 이의신청 삭제 
	@ResponseBody
	@PostMapping(value="/deleteAttendDmr")
	public String deleteAttendDmr(@RequestBody HashMap<String, String> atdcNoMap) {
		log.info("atdcNo?????? : " + atdcNoMap.get("atdcNo").toString());
//		ServiceResult result = attendanceService.deleteAttendDmr(atdcNo);
//		log.info("atdcNo?????? : " + atdcNo);
		String msg = null;
		
//		if(result.equals(ServiceResult.OK)) {
//			msg =  "success";
//		} else {
//			msg = "failed";
//		}
		return null;
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
