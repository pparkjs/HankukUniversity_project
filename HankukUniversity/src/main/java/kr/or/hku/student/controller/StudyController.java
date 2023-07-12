package kr.or.hku.student.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.hku.student.service.StudyService;
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
	public String studyList(Model model) {
		List<StudyVO> studyList = service.studyList();
//		for (StudyVO study : studyList) {
//		    String studyName = study.getStudyName();
//		    
//		    log.info(studyName);
//		}
		
		model.addAttribute("studyList", studyList);
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
	
	@GetMapping("/student/scheduleList")
	public List<StudyVO> scheduleList(@RequestParam("stdNo") String stdNo, Model model) {
		// 시간표 리스트 출력
		StudyVO vo = new StudyVO();
		vo.setStdNo(stdNo);
		vo.setLecapYr("2023");
		List<StudyVO> sList = service.scheduleList(vo);
		model.addAttribute("sList", sList);
		return sList;
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
	
	@PostMapping(value = "/student/assignStudy/{studyNo}/{joinNo}")
	public List<StudyVO> assignStudy(@PathVariable("joinNo") int joinNo, @PathVariable("studyNo") int studyNo) {
		service.assignStudy(joinNo);
		List<StudyVO> appli = service.applicationsList(studyNo);
		return appli;
	}
	@PutMapping(value = "/student/rejStudy/{studyNo}/{joinNo}")
	public List<StudyVO> rejStudy(@PathVariable("joinNo") int joinNo, @PathVariable("studyNo") int studyNo) {
		service.rejStudy(joinNo);
		List<StudyVO> appli = service.applicationsList(studyNo);
		return appli;
	}
	
}

