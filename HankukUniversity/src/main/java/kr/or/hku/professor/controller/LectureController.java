package kr.or.hku.professor.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.vo.CollegeVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.lectureInfo.vo.LectureAplyVO;
import kr.or.hku.lectureInfo.vo.LecturePlanVO;
import kr.or.hku.lectureInfo.vo.LectureTimeTableVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;
import kr.or.hku.professor.service.ILectureService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/hku/lecture")
@Slf4j
public class LectureController {//강의관리 컨트롤러
	
	@Autowired
	private ILectureService lectureService;
	
	
	// 강의개설신청페이지
	@PreAuthorize("hasRole('ROLE_PROFESSOR')")
	@GetMapping("/open")
	public String lectureOpen(Model model) {
		//교과목 목록 조회
		List<SubjectVO> subjectList = lectureService.getSubjectList();
		//단과대학출력
		List<CollegeVO> collegeList = lectureService.getCollegeList();
		//시설출력
		List<FacilityVO> flctList = lectureService.getFlctList();
		//시설물출력
//		List<FacilitiesVO> flctsList = lectureService.getFlctsList();
		
		model.addAttribute("subject",subjectList);
		model.addAttribute("college",collegeList);
		model.addAttribute("flct",flctList);
//		model.addAttribute("flcts",flctsList);
		return "professor/lectureMng";
	}
	
	@ResponseBody
	@GetMapping("/getDept.do")
	public Map<String,List<?>> getDeptList(String college){
		return lectureService.getListMap(college);
	}
	
	@ResponseBody
	@GetMapping("/selSubject.do")
	public List<SubjectVO> selSubject(String deptNm){
		List<SubjectVO> selSublist = lectureService.selSubject(deptNm);
		return selSublist;
	}
	
	//타임테이블 최초 출력
	@ResponseBody
	@GetMapping("/selBuil.do")
	public Map<String , List<?>> getTimeTable(String flct){
		return lectureService.getTimeTable(flct);
	}
	//강의실 선택시 출력
	@ResponseBody
	@GetMapping("/selClass.do")
	public List<LectureTimeTableVO> getClass(String flcts){
		return lectureService.getClass(flcts);
	}
	
	@ResponseBody
	@PostMapping(value = "/applyLecture.do", produces = "application/json;charset=utf-8")
	public String applyLecture(@RequestBody LectureAplyVO vo){
		log.info("시작---------------------------------------------");
		
		int result = 0;
		result = lectureService.applyLecture(vo);
		if(result > 0) {
			log.info("개설성공");
		}
		
		int result1 = 0;
		result1 = lectureService.applyProgram(vo);
		if(result1 > 0) {
			log.info("프로그램성공");
		}
		int result2 = 0;
		result2 = lectureService.applySchedule(vo);
		if(result2 > 0) {
			log.info("스케줄성공");
		}
		log.info("LecapNo : " + vo.getLecapNo());
		
		// 황지현 바보 멍충이!!
		return "성공";
	}
	
	
	//나의 신청현황가져오기
	@ResponseBody
	@GetMapping("/getLectureStatus.do")
	public List<LectureAplyVO> getLectureStatus(String proNo){
		List<LectureAplyVO> lectureStatusList = lectureService.getLectureStatus(proNo);
		return lectureStatusList;
	}
	
	//신청내역 취소하기
	
	@ResponseBody
	@GetMapping("/returnLecture.do")
	public void returnLecture (String lecapNo) {
		lectureService.returnLecture(lecapNo);
	}
	
	@ResponseBody
	@GetMapping("/getMyLectire")
	public List<LectureAplyVO> getMyLectire(){
		User users = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return lectureService.getMyLectire(users.getUsername());
	}
	
//	기존 작성되있는 강의계획서 불러오기
	
	@ResponseBody
	@GetMapping("/loadPlan")
	public LecturePlanVO loadPlan(String subNo) {
		LecturePlanVO vo = lectureService.loadPlan(subNo);
		return  vo;
	}
	
	
	
}
