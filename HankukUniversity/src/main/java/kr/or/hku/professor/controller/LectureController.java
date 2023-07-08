package kr.or.hku.professor.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.hku.admin.vo.CollegeVO;
import kr.or.hku.admin.vo.FacilityVO;
import kr.or.hku.lectureInfo.vo.SubjectVO;
import kr.or.hku.professor.service.ILectureService;

@Controller
@RequestMapping("/lecture")
public class LectureController {//강의관리 컨트롤러
	
	@Autowired
	private ILectureService lectureService;
	
	// 강의개설신청페이지
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
	@GetMapping("/timeTable.do")
	public Map<String , List<?>> getTimeTable(String flct){
		return lectureService.getTimeTable(flct);
	}

}
