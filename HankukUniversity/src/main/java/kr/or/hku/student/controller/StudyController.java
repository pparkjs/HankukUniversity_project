package kr.or.hku.student.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.student.service.StudyService;
import kr.or.hku.student.vo.RecordVO;
import kr.or.hku.student.vo.StdCalendarVO;
import kr.or.hku.student.vo.StudentVO;
import kr.or.hku.student.vo.StudyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/hku")
@Transactional
public class StudyController {
	
	@Inject
	private StudyService service;
	
	
	
	@GetMapping(value = "/student/study")
	public String studyList(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		String stdNo = stdVo.getStdNo();
		List<StudyVO> studyList = service.studyList(stdNo);		
		List<StudyVO> waitStudy = service.waitStudy(stdNo);		
		model.addAttribute("studyList", studyList);
		model.addAttribute("waitStudy", waitStudy);
		return "student/study";
	}
	
	@PostMapping(value = "/student/study")
	public String addStudy(@RequestParam("studyName") String studyName,
	                       @RequestParam("studyCpcy") int studyCpcy,
	                       @RequestParam("studyIntro") String studyIntro,
	                       HttpServletRequest request) {

	    StudyVO vo = new StudyVO();
	    log.info(vo.getStudyName());
	    log.info("" + vo.getStudyCpcy());
	    log.info(vo.getStudyIntro());
	   
	    HttpSession session = request.getSession();
	    StudentVO stdVo = (StudentVO) session.getAttribute("std");
//	    log.info("현재 로그인 정보: " + stdVo.getStdNo());
	    log.info("현재 로그인 정보: " + stdVo.getStdNo());

	    vo.setStudyName(studyName);
	    vo.setStudyCpcy(studyCpcy);
	    vo.setStudyIntro(studyIntro);
	    if (stdVo != null) {
	    	vo.setStdNo(stdVo.getStdNo());
	    }

	    service.addStudy(vo);
	    
	    return "student/study";
	}

	@GetMapping(value = "/student/studyRoom")
	public String studyRoom(int studyNo, Model model){
		// 스터디룸에 대한정보
		StudyVO study = service.studyRoom(studyNo);
		// 해당 스터디룸에 속한 스터디 멤버
		List<StudyVO> studyMem = service.studyMem(studyNo);
		for (StudyVO vo : studyMem) {
			String role = vo.getStudyRole();
			log.info("role check: " + role);
		}
		// 가입신청 대기중인 멤버목록
		List<StudyVO> appli = service.applicationsList(studyNo);
		
		model.addAttribute("study", study);
		model.addAttribute("studyMem", studyMem);
		model.addAttribute("appli", appli);
		return "student/studyRoom";
	}
	
//	@ResponseBody
//	@GetMapping("/student/studyMem")
//	public ResponseEntity<List<StudyVO>> memList(@RequestParam int studyNo){
//		List<StudyVO> list = service.studyMem(studyNo);
//		return new ResponseEntity<List<StudyVO>>(list, HttpStatus.OK);
//	}
	
	@ResponseBody
	@GetMapping("/student/scheduleList")
	public ResponseEntity<List<StudyVO>> scheduleList(@RequestParam("stdNo") String stdNo) {
		log.info("stdNo: " + stdNo);
		// 시간표 리스트 출력
		StudyVO vo = new StudyVO();
		vo.setStdNo(stdNo);
		vo.setLecapYr("2023");
		List<StudyVO> sList = service.scheduleList(vo);
//		for (int i = 0; i < sList.size(); i++) {
//			log.info("sList: "+ sList.get(i));
//		}
		return new ResponseEntity<List<StudyVO>>(sList,HttpStatus.OK);
	}
	
	@PostMapping(value = "/student/delStudy")
	public String delStudy(@RequestParam("studyNo") int studyNo) {
		service.delStudy(studyNo);
		return "redirect:/hku/student/study";
	}
	
	@PostMapping(value = "/student/exitStudy")
	public String exitStudy(@RequestParam("studyNo") int studyNo, HttpServletRequest request){
	    HttpSession session = request.getSession();
	    StudentVO stdVo = (StudentVO) session.getAttribute("std");
		StudyVO studyVo = new StudyVO();
		studyVo.setStudyNo(studyNo);
		studyVo.setStdNo(stdVo.getStdNo());
		
		service.exitStudy(studyVo);
		return "redirect:/hku/student/study";
	}
	
	//가입 승인
	@ResponseBody
	@PostMapping(value = "/student/assignStudy")
	public ResponseEntity<Integer> assignStudy(@RequestParam("joinNo") int joinNo) {
		int res = service.assignStudy(joinNo);
		
		return new ResponseEntity<Integer>(res,HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/student/rejStudy")
	public ResponseEntity<Integer> rejStudy(@RequestParam("joinNo") int joinNo) {
		int res = service.rejStudy(joinNo);
		
		return new ResponseEntity<Integer>(res,HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping("/student/chatList")
	public ResponseEntity<List<StudyVO>> chatList( HttpServletRequest request) {
		HttpSession session = request.getSession();
		StudentVO stdVo = (StudentVO) session.getAttribute("std");
		String stdNo = stdVo.getStdNo();
		
		List<StudyVO> cList = service.studyList(stdNo);
		return new ResponseEntity<List<StudyVO>>(cList,HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value="/student/messageList")
	public ResponseEntity<List<StudyVO>> messageList(@RequestParam("studyNo") int studyNo, @RequestParam("stdNo") String stdNo) {
	    // 해당 방의 메시지 리스트 가져오기
	    List<StudyVO> list = service.messageList(studyNo); 
	    // userId 는 안읽은 메시지 처리 위해서 받아온건데 1:1이 아니라 멀티 채팅방일때 생각중
	    return new ResponseEntity<List<StudyVO>>(list, HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value="/student/studymemberList")
	public ResponseEntity<List<StudyVO>> studymemberList(int studyNo) {
		// 해당 방의 멤버 리스트 가져오기
		List<StudyVO> list = service.studyMem(studyNo); 
		return new ResponseEntity<List<StudyVO>>(list, HttpStatus.OK);
	}
		
	@ResponseBody
	@GetMapping("/student/study-calendar")
	public List<StdCalendarVO> getStdCalList(@RequestParam Map<String, String> map){
		log.info("캘리더 정보 가져오기" + map.toString());
		return service.getStdCalList(map);
	}
	
	@ResponseBody
	@PutMapping("/student/study-calendar")
	public int updateStdCalList(@RequestBody StdCalendarVO stdCalendarVO){
		log.info("캘리더 수정" + stdCalendarVO.toString());
		return service.updateStdCalList(stdCalendarVO);
	}
	
	
	@ResponseBody
	@PostMapping("/student/study-calendar")
	public StdCalendarVO addStdCalList(@RequestBody StdCalendarVO stdCalendarVO){
		log.info("캘리더 저장" + stdCalendarVO.toString());
		int res = service.addStdCalList(stdCalendarVO);
		return stdCalendarVO;
	}
	
	@ResponseBody
	@DeleteMapping("/student/study-calendar")
	public int deleteCalendar(@RequestBody Map<String, String> map) {
		log.info("삭제 할떄 하는 데이터 " + map.toString());
		
		int res = service.deleteStdCalendar(map);
		
		return res;
	}
	
}

