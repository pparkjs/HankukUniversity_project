package kr.or.hku.controller.student;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.hku.service.common.ICommonService;
import kr.or.hku.service.student.ICourseInfoService;
import kr.or.hku.vo.CommonVO;
import kr.or.hku.vo.DepartmentVO;
import kr.or.hku.vo.LectureAplyVO;
import kr.or.hku.vo.SubjectVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/hku/student")
public class CourseInfoController {
	
	@Autowired
	private ICourseInfoService courseService;
	
	@Autowired
	private ICommonService commonService;
	
	//교과목정보 페이지 이동
	@GetMapping("/search-subject")
	public String subjectForm(Model model) {
		List<CommonVO> commonList = commonService.getAllCommonData();
		List<DepartmentVO> deptList = courseService.getAllDept();
		model.addAttribute("commonList", commonList);
		model.addAttribute("deptList", deptList);
		return "student/search-subject";
	}
	
	//교과목정보 리스트 가져오기  (검색포함)
	@ResponseBody
	@GetMapping("/sub-list")
	public ResponseEntity<List<SubjectVO>> getList(@RequestParam Map<String, Object> map){
		List<SubjectVO> list = courseService.getList(map);
		return new ResponseEntity<List<SubjectVO>>(list, HttpStatus.OK);
	}
	
	
	// 수강신청 페이지 이동
	@GetMapping("/course-req")
	public String courseReqForm(Model model) {
		List<CommonVO> commonList = commonService.getAllCommonData();
		List<DepartmentVO> deptList = courseService.getAllDept();
		model.addAttribute("commonList", commonList);
		model.addAttribute("deptList", deptList);
		return "student/course-req";
	}
	
	// 수강신청할 강의리스트 가져오기
	@ResponseBody
	@GetMapping("/lecture-list")
	public ResponseEntity<List<LectureAplyVO>> courseList(@RequestParam Map<String, Object> map) {
		 String status = "appv";
		 List<LectureAplyVO> list = courseService.getLecture(status);
		 return new ResponseEntity<List<LectureAplyVO>>(list, HttpStatus.OK);
	}
	
}
