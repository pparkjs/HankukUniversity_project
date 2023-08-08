package kr.or.hku.classroom.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.service.AssignmentService;
import kr.or.hku.classroom.service.AttendanceService;
import kr.or.hku.classroom.service.ClassroomService;
import kr.or.hku.classroom.service.GradeManageService;
import kr.or.hku.classroom.service.LectureNoticeService;
import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.AttendanceVO;
import kr.or.hku.classroom.vo.GradeVO;
import kr.or.hku.classroom.vo.LectureNoticeVO;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.common.vo.AttachFileVO;
import kr.or.hku.lectureInfo.service.CourseInfoService;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.LecturePlanVO;
import kr.or.hku.professor.vo.ProfessorVO;
import lombok.extern.slf4j.Slf4j; 

@Slf4j
@Controller
@RequestMapping("/hku/professor")
public class ProClassroomController {
	
	@Autowired
	private CourseInfoService courseService;
	
	@Autowired
	private ClassroomService classService;
	
	@Autowired
	private CommonFileService fileService;
	
	@Autowired
	private AssignmentService assignService;
	
	@Autowired
	private AttendanceService attendService;
	
	@Autowired
	private GradeManageService gradeService;
	
	
	@Autowired
	private LectureNoticeService noticeService;
	
	// 클래스룸 목록
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/proClassroomList")
	public String classroom(Model model, HttpServletRequest request) {
		log.info("classroomList 실행 !");
		
		HttpSession session = request.getSession();
		ProfessorVO proVo = (ProfessorVO) session.getAttribute("pro");
		List<LectureAplyVO> list = classService.proSelectList(proVo.getProNo());
		
		model.addAttribute("list", list);
		return "professor/classroomList";
	}
	
	// 클래스룸 메인
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/classroomMain/{lecapNo}")
	public String enterClass(@PathVariable String lecapNo,
							Model model,
							HttpSession session) {
		session.setAttribute("lecapNo", lecapNo);
		
		LectureAplyVO lecVO = courseService.getLecAplyInfo(lecapNo);
		
		String subNm =  classService.getSubNm(lecapNo);
		session.setAttribute("subNm", subNm);
		
		log.info("개설신청번호 들어와 =>   " + lecapNo);
		// 해당 과목에 해당 년도 학기에 대한 과제 리스트 가져옴
		List<AssignmentVO> asgList = classService.getAssignList(lecapNo);
		
		// 해당 과목에 해당 년도 학기에 대한공지사항 리스트 가져와야함
		// 지현이누나의 몫 여기다 작성하시오
		List<LectureNoticeVO> noticeList = noticeService.getNoticeList(lecapNo);
		log.info(""+asgList);
		model.addAttribute("lecVO", lecVO);
		model.addAttribute("lecapNo", lecapNo);
		model.addAttribute("subNm", subNm);
		model.addAttribute("asgList", asgList);
		model.addAttribute("noticeList", noticeList);
		return "professor/classroomMain";
	}
	
	
	// 과제 목록
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/assignmentList/{lecapNo}")
	public String assignList(@PathVariable String lecapNo,
							Model model) {
		List<AssignmentVO> list =  classService.getAssignList(lecapNo);
		log.info("lecapNo" + lecapNo);
		model.addAttribute("lecapNo", lecapNo);
		model.addAttribute("list", list);
		return "professor/assignmentList";
	}
	
	// 과제 상세 
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/assignmentDetail/{asmNo}")
	public String assignOne(@PathVariable String asmNo,
							Model model) {
		 log.info("asmNo :" + asmNo);
		 // 교수가 등록한 과제 정보
		 AssignmentVO assignVo = assignService.assignOne(asmNo);
		 log.info("assignVo : " + assignVo);
		 
		 // 학생이 제출한 파일 확인
		 int atchFileNo = assignVo.getAtchFileNo();
		 List<AttachFileVO> fileList = fileService.getFileList(atchFileNo);
		 assignVo.setFileList(fileList);
		 model.addAttribute("assignVo", assignVo);
		 
		 return "professor/assignmentDetail";
	}
	
	// 과제 등록폼
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/regiForm")
	public String regiForm() {
		return "professor/regiForm";
	}
	
	// 과제 등록
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@PostMapping(value = "/regiAssignment")
	public String regi(AssignmentVO vo, HttpSession session) {
		// -1 이면 파일없음   -1 이 아니면 파일이 있음
		log.info("과제 등록 vo : " + vo.toString());
		MultipartFile file = vo.getAssignFile();
		int attachFileNo = -1;
		if (file != null && file.getSize() > 0) {
			// 파일 기본키 생성 시퀀스 생성 
			attachFileNo = fileService.getAttachFileNo();
			// 성공하면 1 실패하면 0 
			int resultCnt = fileService.insertFile(file, attachFileNo, 0);
			log.info("파일 저장 성공했는지  " + resultCnt);
		}
		
		// 파일이 없으면 위 if문 실행 안되서 -1 들어감 파일 있으면 attachFileNo = fileService.getAttachFileNo(); 여기서 생긴 번호가 들어감
		vo.setAtchFileNo(attachFileNo);
		
		int regiCnt = assignService.regi(vo, session);
		
		log.info("인서트한 vo" + vo.toString());
		
		// 해당 과목을 듣는 학생 리스트 (과제제출 테이블 컬럼과 함께 -> 여기서는 학번만 필요함)
		List<String> stdList = assignService.getStdList(vo.getLecapNo()); 
		
		log.info("stdList : " + stdList.toString());
		log.info("asmNo가져옴! : " + vo.getAsmNo());
		
		assignService.giveAssignToStds(stdList, vo.getAsmNo());
		
		// --------- 알람기능 추가 할거에여 ---------//
		
		
		
		// ----------------------------------//
		return "redirect:/hku/professor/assignmentDetail/"+vo.getAsmNo();
	}
	
	
	// 과제 수정폼
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/updateForm/{asmNo}")
	public String updateForm(@PathVariable("asmNo") String asmNo, Model model) {
		AssignmentVO vo = assignService.assignOne(asmNo);
		model.addAttribute("vo", vo);
		model.addAttribute("status", "u");
		return "professor/regiForm";
	}
	
	// 과제 수정
	@PostMapping(value = "/updateAssignment")
	public String update(AssignmentVO vo, Model model) {
		String goPage = "";
		ServiceResult result = assignService.update(vo);
		
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/hku/professor/assignmentDetail/" + vo.getAsmNo();
		}
		else {
			model.addAttribute("vo", vo);
			model.addAttribute("status", "u");
			goPage = "/regiForm";
		}
		return goPage;
	}
	
	
	// 과제삭제 
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@PostMapping("/deleteAssignment")
	public String delete(String asmNo) {
		return "professor/assignmentList";
	}         
	
	// 해당 과제번호에 대한 학생 리스트 가져오기
	@ResponseBody
	@GetMapping("/assignmentDetail")
	public ResponseEntity<List<AssignmentVO>> getStdListByAssign(String asmNo){
		List<AssignmentVO> list = assignService.getStdListByAssign(asmNo);
		return new ResponseEntity<List<AssignmentVO>>(list, HttpStatus.OK);
	}
	
	// 해당 과제에 성적 부여
	@ResponseBody
	@PostMapping("/giveScore")
	public String giveScore(@RequestBody AssignmentVO assignmentVO){
		log.info("giveScore 전달 파라미터" + assignmentVO.toString());
		int res = assignService.giveScore(assignmentVO);
		
		String msg = null;
		if (res > 0) {
			msg = "success";
		}
		return msg;
	} 
	
	// 출석관리
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/manageAttendance")
	public String getStdList(String lecapNo, Model model) {
		model.addAttribute("lecapNo", lecapNo);
		return "professor/stdAttendanceList"; 
	}
	
	// 학생 리스트를 가져오는 비동기 
	@ResponseBody
	@GetMapping("/getStdAttendance") 
	public List<AttendanceVO> getStdAttendance(AttendanceVO vo) {
		log.info("list!!!!!!!! : " + vo.toString());
		List<AttendanceVO> list = attendService.getStdList(vo.getLecapNo());
		return list;
	}
	
	//출석 여부 리스트 가져오기
	@ResponseBody
	@GetMapping("/getStdAttendance-list") 
	public List<AttendanceVO> getStdAttendanceList(AttendanceVO vo) {
		List<AttendanceVO> list = attendService.getStdAttendanceList(vo);
		return list;
	}
	
	//출석 변경 이벤트 
	@ResponseBody
	@PutMapping("/updateAttendance")
	public String updateAttendance(@RequestBody AttendanceVO vo) {
		log.info("updateAttendance 전달 파라미터" + vo.toString());
		int res = attendService.updateAttendance(vo);
			String msg = null;
			if(res > 0) {
			 msg = "success"; 
		}
		return msg;
	}
		

	// 출석 이의신청 페이지 
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/attendanceDmrManage")
	public String attendDmrStatus(HttpSession session, Model model) {
		String lecapNo = (String) session.getAttribute("lecapNo");
		List<AttendanceVO> attendList = attendService.attendanceDmrList(lecapNo);
		
		log.info("attendList" + attendList.toString());
		
		model.addAttribute("attendList", attendList);
		return "professor/attendanceDmrManage";
	}
	

	// 출석 이의신청 승인
	@ResponseBody
	@PostMapping("/attendanceDmr-Appv")
	public String attendanceDmrAppv(String atdcNo) {
		log.info("vo !! : " + atdcNo);
		ServiceResult result =attendService.attendanceAppv(atdcNo);
		String msg = null;
			if(result == ServiceResult.OK) {
			 msg = "success";
			}
			return msg;
	}
	
	// 출석 이의신청 반려 
	@ResponseBody
	@PostMapping("/attendanceDmr-rej")
	public String attendanceDmrRej(String atdcNo) {
		log.info("vo !! : " + atdcNo);
		ServiceResult result = attendService.attendanceRej(atdcNo);
		String msg = null;
		if(result == ServiceResult.OK) {
			msg = "success";
		}
		return msg;
	}
	
	// 학생 성적 관리
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/gradeManageTable/{lecapNo}")
	public String gradeManage(@PathVariable String lecapNo, Model model) {
		LecturePlanVO lecPlanVo= gradeService.getPercent(lecapNo);
		List<GradeVO> getStdList = gradeService.getStdList(lecapNo);
		int lecpgMdTest = lecPlanVo.getLecpgMdTest();
		int lecpgFnTest = lecPlanVo.getLecpgFnTest();
		log.info("getStdList ===>" + getStdList.toString());
		
		List<GradeVO> returnStdList = new ArrayList<GradeVO>();
		for (GradeVO gradeVO : getStdList) {
			gradeVO.setLecapNo(lecapNo);
			gradeVO.setLecpgMdTest(lecpgMdTest);
			gradeVO.setLecpgFnTest(lecpgFnTest);
			gradeVO = settingScr(gradeVO, lecPlanVo);
			returnStdList.add(gradeVO);
		}
		
		model.addAttribute("stdList", returnStdList);
		return "professor/gradeTable";
	}	
	
	private GradeVO settingScr(GradeVO gradeVO, LecturePlanVO lecPlanVo) {
		int lecpgAtd = lecPlanVo.getLecpgAtd(); // 출석 성적 비율
		int lecpgHw = lecPlanVo.getLecpgHw();	// 과제
		int lecpgMdTest = lecPlanVo.getLecpgMdTest(); // 중간
		int lecpgFnTest = lecPlanVo.getLecpgFnTest(); // 기말
		
		// 출석 횟수 가져오기
		Map<String, String> stdAtdCntMap = gradeService.getStdAtdCnt(gradeVO);
		Map<String, String> stdAsignScrMap = gradeService.getStdAsignScr(gradeVO);
		
		int middleScr = gradeVO.getMiddleScr();
		int finalScr = gradeVO.getFinalScr();
		
		int attendScr = Math.round(((float)Integer.parseInt(String.valueOf(stdAtdCntMap.get("ATD_CNT"))) / 15) * lecpgAtd);
		int assignScr = Math.round(((float)Integer.parseInt(String.valueOf(stdAsignScrMap.get("ASN_SUM"))) / (Integer.parseInt(String.valueOf(stdAsignScrMap.get("ASN_CNT"))) * 100) * lecpgHw));
		
		middleScr = Math.round(((float)  middleScr / 100) * lecpgMdTest); // 중간 계산 끝
		finalScr = Math.round(((float) finalScr / 100) * lecpgFnTest); 	  // 기말 계산 끝
		
		gradeVO.setAttendScr(attendScr+"");
		gradeVO.setAssignScr(assignScr+""); 
		
		gradeVO.setMiddleScr(middleScr);
		gradeVO.setFinalScr(finalScr);
		return gradeVO;
	}

	// 성적 확정 
	@ResponseBody
	@PostMapping("/confirmScore")
	public String confirmScore(@RequestBody GradeVO vo) {
		log.info("===================================");
		ServiceResult result = gradeService.confirmScore(vo);
		String msg = null;
		if(result.equals(ServiceResult.OK)) {
			msg = "success";
		}
		return msg;
	}
	
	// 시험성적 수정 
	@ResponseBody
	@PutMapping("/modifyScore")
	public String modifyScore(@RequestBody GradeVO vo) {
		ServiceResult result = gradeService.confirmScore(vo);
		String msg = null;
		if(result.equals(ServiceResult.OK)) {
			msg = "success";
		}
		return msg;
	}
	
	
	
}
