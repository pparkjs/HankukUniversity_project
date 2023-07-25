package kr.or.hku.classroom.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.hku.ServiceResult;
import kr.or.hku.classroom.service.AssignmentService;
import kr.or.hku.classroom.service.AttendanceService;
import kr.or.hku.classroom.service.ClassroomService;
import kr.or.hku.classroom.vo.AssignmentVO;
import kr.or.hku.classroom.vo.AttendanceVO;
import kr.or.hku.common.service.CommonFileService;
import kr.or.hku.lectureInfo.service.CourseInfoService;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
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
	
	// 클래스룸 목록
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
		
		log.info(""+asgList);
		model.addAttribute("lecVO", lecVO);
		model.addAttribute("lecapNo", lecapNo);
		model.addAttribute("subNm", subNm);
		model.addAttribute("asgList", asgList);
		return "professor/classroomMain";
	}
	
	
	// 과제 목록
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
	@GetMapping("/assignmentDetail/{asmNo}")
	public String assignOne(@PathVariable String asmNo,
							Model model,
							HttpSession session) {
		 log.info("asmNo :" + asmNo);
		 // 교수가 등록한 과제 정보
		 AssignmentVO assignVo = assignService.assignOne(asmNo);
		 log.info("assignVo : " + assignVo);
//		 session.setAttribute("asmNo", asmNo);
		 model.addAttribute("assignVo", assignVo);
		 
		 //학생 목록 가져오기
//		 List<AssignmentVO> stdList = assignService.getStdList(asmNo);
//		 model.addAttribute("stdList", stdList);
		return "professor/assignmentDetail";
	}
	
	// 과제 등록폼
	@GetMapping("/regiForm")
	public String regiForm(HttpSession session, Model model) {
//		String lecapNo = (String) session.getAttribute("lecapNo");
//		AssignmentVO assignVO = assignService.getAssignOne(lecapNo);
//		log.info(lecapNo + "");
//		model.addAttribute("assignVO", assignVO);
		return "professor/regiForm";
	}
	
	// 과제 등록
	@PostMapping(value = "/regiAssignment")
	public String regi(AssignmentVO vo) {
		// -1 이면 파일없음   -1 이 아니면 파일이 있음
		log.info("과제 등록 vo : " + vo.toString());
		MultipartFile file = vo.getAssignFile();
		int attachFileNo = -1;
		if (file != null && file.getSize() > 0) {
			
			// 파일 기본키 생성 시퀀스 생성 한다고 생각하면됨
			attachFileNo = fileService.getAttachFileNo();
			// 성공하면 1 실패하면 0 
			int resultCnt = fileService.insertFile(file, attachFileNo, 0);
			log.info("파일 저장 성공했는지  " + resultCnt);
		}
		
		// 파일이 없으면 위에 if문 실행 안되서 -1 들어 갈거고 파일이 있으면 attachFileNo = fileService.getAttachFileNo(); 여기서 생긴 번호가 들어감
		vo.setAtchFileNo(attachFileNo);
		
		int regiCnt = assignService.regi(vo);
		
		log.info("인서트한 vo" + vo.toString());
		
		// 해당 과목을 듣는 학생 리스트 (과제제출 테이블 컬럼과 함께 -> 여기서는 학번만 필요함)
		List<String> stdList = assignService.getStdList(vo.getLecapNo()); 
		
		log.info("stdList : " + stdList.toString());
		log.info("asmNo가져옴! : " + vo.getAsmNo());
		
		assignService.giveAssignToStds(stdList, vo.getAsmNo());
		
		// --------- 알람기능 추가 할거에여 ---------//
		
		
		
		// ----------------------------------//
		return "redirect:/hku/professor/assignmentList/"+vo.getLecapNo();
	}
	
	// 과제 수정폼
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
	@GetMapping("/manageAttendance")
	public String getStdList(String lecapNo, Model model) {
		model.addAttribute("lecapNo", lecapNo);
		return "professor/stdAttendanceList"; 
	}
	
	//사용자 리스트를 가져오는 비동기 
	@ResponseBody
	@GetMapping("/getStdAttendance") 
	public List<AttendanceVO> getStdAttendance(AttendanceVO vo) {
		log.info("list!!!!!!!! : " + vo.toString());
		List<AttendanceVO> list = attendService.getStdList(vo.getLecapNo());
		log.info("list!!!!!!!! : " + list.toString());
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
		
	// 학생 성적 관리
	@GetMapping("/stdGradeList/{lecapNo}")
	public String stdGradeList(@PathVariable("lecapNo") String lecapNo) {
		return "professor/gradeTable";
	}
}
