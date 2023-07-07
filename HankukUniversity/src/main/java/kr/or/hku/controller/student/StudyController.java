package kr.or.hku.controller.student;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.hku.service.student.StudyService;
import kr.or.hku.vo.StudyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/hku")
public class StudyController {
	
	@Inject
	private StudyService service;
	
//	@GetMapping(value = "/student/study")
//	public String record() {
//		return "student/study";
//	}
	
	@GetMapping(value = "/student/study")
	public String studyList(Model model) {
		List<StudyVO> studyList = service.studyList();
		for (StudyVO study : studyList) {
		    String studyName = study.getStudyName();
		    
		    log.info(studyName);
		}
		
		model.addAttribute("studyList", studyList);
		return "student/study";
	}
	
	@PostMapping(value = "/student/study")
	public String addStudy(@RequestParam("studyName") String studyName,
	                       @RequestParam("studyCpcy") int studyCpcy,
	                       @RequestParam("studyIntro") String studyIntro
	                    	) {
		StudyVO vo = new StudyVO();
		log.info(vo.getStudyName());
		log.info(""+vo.getStudyCpcy());
		log.info(vo.getStudyIntro());

	    vo.setStudyName(studyName);
	    vo.setStudyCpcy(studyCpcy);
	    vo.setStudyIntro(studyIntro);
	    vo.setStdNo("20210001");
	    service.addStudy(vo);    
	    
	    return "student/study";
	}

	@GetMapping(value = "/student/studyRoom")
	public String studyRoom(int studyNo, Model model){
		// 스터디룸에 대한정보
		StudyVO study = service.studyRoom(studyNo);
		// 해당 스터디룸에 속한 스터디 멤버
		List<StudyVO> studyMem = service.studyMem(studyNo);
		// 가입신청 대기중인 멤버목록
//		List<StudyVO> appli = service.applicationslist(studyNo);
		model.addAttribute("study", study);
		model.addAttribute("studyMem", studyMem);
//		model.addAttribute("appli", appli);
		return "student/studyRoom";
	}
	
}
